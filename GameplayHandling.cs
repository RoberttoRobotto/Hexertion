using Godot;
using System;
using System.Collections;

public partial class GameplayHandling : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
//    HexTileMapGenerator3 genInstance = GameObject.GetComponent<HexTileMapGenerator3>();
	HexTileMapGenerator RegenerateGrid;

	// Start is called before the first frame update
	void Start()
	{
		RegenerateGrid = Object.Find("TileGenerator").GetComponent<HexTileMapGenerator>();
	}

	int score = 0;
//	Ray ray;
//	var ray_start = cam.project_ray_origin(m_pos);
//	RaycastHit hit;

	// Update is called once per frame
	void Update()
	{
		if (Input.GetMouseButtonDown(0))
		{
			ray = Camera.main.ScreenPointToRay(Input.mousePosition);
//            RaycastHit hit;
			if (Physics.Raycast(ray, out hit))
			{
				string checkTile = hit.transform.Object.GetComponent<HexagonPropertiesQRS>().getType();
				if (checkTile == "VALID" || checkTile == "INVALID")
				{
//                    Debug.Log("Hit the hexagon: " + hit.transform.Object.name);
					hit.transform.Object.GetComponent<HexagonPropertiesQRS>().cycleThroughChoices();
				}//End if
			}//End if
		}//End if

//        if (Physics.Raycast(ray, out hit, 100.0f))
//        {
//            if (hit.transform != null)
//            {
//                PrintName(hit.transform.Object);
//            }
//        }//End if
	}//End method

	private void PrintName(Object go)
	{
		print(go.name);
	}

	void OnMouseDown()
	{
		if (Physics.Raycast(ray, out hit)) 
			Debug.Log("Hit something");
	}//End method

	public void checkAnswers()
	{
		List<Object> allTiles = new List<Object>();
		allTiles.AddRange(Object.FindGameObjectsWithTag("GameTile"));
		int numWrongTiles = 0;
		bool isValid;
		int playersChoice;

		for (int i = 0; i < allTiles.Count; i++)
		{
			if( allTiles[i].GetComponent<HexagonPropertiesQRS>().getType() == "VALID")
			{
				isValid = true;
			}//End if
			else
			{
				isValid = false;
			}//End else

			playersChoice = allTiles[i].GetComponent<HexagonPropertiesQRS>().getPlayersChoice();

			if (playersChoice == 0)
			{
				Debug.Log("WARNING: There is at least one tile that is still undecided. Aborting score check.");
				return;
			}//End if
			else if ((isValid == true && playersChoice == 1) || (isValid == false && playersChoice == 2))
			{
				//TODO: Add score for this tile. Lock it so it can't be changed.
				//Score for each tile = Num on tile * Time remaining (Max 10) * Accuracy (Max 10)
			}//End if else
			else
			{
				numWrongTiles++;
				//Set accuracy score of tile to half.
			}//End else
		}//End for

		if (numWrongTiles > 0)
		{
			Debug.Log("FAILURE: There are " + numWrongTiles + " tile(s) marked incorrectly!");
			//TODO: 
		}//End if
		else
		{
			Debug.Log("SUCCESS!");
			StartCoroutine(regenerateGrid());
			//TODO: Have an end screen. If the gameplay is set to an endless mode
		}//End else
	}//End if

	IEnumerator regenerateGrid()
	{
		Debug.Log("Hexagon Grid solved successfully. Recreating the hexagon.");
		//TODO: Create an animation that turns off all of the grids here
		yield return new WaitForSeconds(1); //TODO: Create an animation that turns all tiles light cyan
		RegenerateGrid.ResetHexTileMap();
		//TODO: Create a new hexagon tile set
	}


	public void retire()
	{
		//TODO: Determine Score - 
		//TODO: Add scene fade out transition - 
		SceneManager.LoadScene("MainMenu");
	}
}//End class
