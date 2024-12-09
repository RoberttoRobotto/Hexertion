using Godot;
using System;
using System.Collections.Generic;

public partial class HexTileMapGenerator : Node
{
	public Object hexTilePrefab;
	public Object hexTiledirPrefab;
	protected List<Object> allTiles = new List<Object>();
	public Node holder;

	public int currGameType = 0;

//[SerializeField] int radius = 3;
	[Export] int radius = 3;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		InitialGenerateHexTileMap();
	}


	
		public void InitialGenerateHexTileMap()
	{
		// 1) Generate the playable field
		CreateHexTileMap();
		setInitialText();
		SetHexTileMap();
		// 2) Set the tiles to random types
		//        SetTilesTypes();
		//        SetInvalidTiles();
		// 3) Add a text onto the tile
		//        setAdjNumOnTiles();
		//        setTextOnTiles();
		// 4) Start Gameplay
	}//End method
	
		public void SetHexTileMap()
	{
		//0) Add +1 to total completed puzzles based on puzzle type

		//1) Hide the tile types
		//GET GAME TYPE - Set the tiles to random types based on the player
		//        SetTilesTypes(PlayerPrefs.GetInt("GameType",0));// 2) Set the tiles to random types based on the player
		SetTilesTypes(2);
		//3) Add a text onto the tile
		setAdjNumOnTiles();
		//4) Show tiles
		//5) Start Gameplay
	}
	
		public void ResetHexTileMap()
	{
		ResetTileTypes();
		setInitialText();
		SetHexTileMap();
	}
	
	void CreateHexTileMap()
	{
		Debug.Log("CreateHexTileMap()");
		for (float q = -radius + 1; q <= radius - 1; q++)
		{
			float s, r;
			if (Mathf.Sign(q) == -1)
			{
				s = radius;
				r = -(Mathf.Abs(radius) - Mathf.Abs(q));
			}//End if
			else
			{
				s = radius - q;
				r = -radius;
			}//End else

			for (float n = r; s >= n; s--, r++)
			{
				Object TempGO = Instantiate(hexTilePrefab);

				//                Debug.Log(TempGO);

				Vector3 pos;

				pos = new Vector3(
					q * 1.53f, //x = q * yConst
							   //(Mathf.Sign(q) * (Mathf.Abs(r)) + (Mathf.Sign(q) * -Mathf.Abs(s))) * yConst,
					(s - r) * 0.88f, //y = ((q * -r) + (q * s)) * xConst
					0);

				SetTileInfo(TempGO, q, r, s, pos);
				allTiles.Add(TempGO);
			}//End for
		}//End for

		float a = 0.62f * (Screen.width / 720);

		holder.localPosition = new Vector3(0, 1, 0);
		holder.localScale = new Vector3(a, a, 1);
	}//End method
	
	
	
}
