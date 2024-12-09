using Godot;
using System;

//public partial class HexagonProperties : Node
//{
public class HexagonPropertiesQRS2 : Node3D
{
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	public enum TileType { BASIC, INVISIBLE, BORDER }
	public TileType CurrType = TileType.BASIC;

	public enum TileSubType { UNSET, NECESSARY, INCLUDESELF, ATLEAST, BLANK }
	public TileSubType CurrSubType = TileSubType.UNSET;

	public bool IsNecessary = false;

	public enum TileValidity { UNSET, VALID, INVALID }
	public TileValidity CurrValidity = TileValidity.UNSET;

	float qPos, rPos, sPos; // Q, R, and S positions

	public enum Choice { UNDECIDED, VALID, INVALID }
	public Choice PlayersChoice = Choice.UNDECIDED;

	public Color currColor = Color.from_hsv(1,1,1,1);
	
	public int numAdjValidTiles;

		//~~~~~~~~~~~~ Set main tile types ~~~~~~~~~~~~

	public void RemoveCurrentGroup(string groupToRemove)
	{
		this.remove_from_group(groupToRemove);
	}
	public void UnsetMain()
	{
//		this.tag = "UnsetTile"; //TODO: ADD GROUPS HERE.
		this.remove_from_group("ADD GROUPS HERE");
		
		this.currType = tileType.UNSET;
		this.GetComponent<Renderer>().enabled = true;
	}//End method
	public void SetInvalid()
	{
//		this.tag = "InvalidTile";
		this.add_to_group("InvalidTile");
		this.currType = tileType.INVALID;
	}//End method
	public void SetValid()
	{
//		this.tag = "ValidTile";
		this.add_to_group("ValidTile");
		this.currType = tileType.VALID;
	}//End method
	public void SetInvisible()
	{
//		this.tag = "InvisibleTile";
		this.add_to_group("InvisibleTile");
		this.currType = tileType.INVISIBLE;
		this.GetComponent<Renderer>().enabled = false;
	}//End method
	public void SetBorder()
	{
//		this.tag = "BorderTile";
		this.add_to_group("BorderTile");
		this.currType = tileType.BORDER;
		GetComponent<MeshRenderer>().material.color = new Color(0.5f, 1, 0.5f, 1);
	}//End method

	//~~~~~~~~~~~~ Set sub tile types ~~~~~~~~~~~~

	public void UnsetSub()
	{
		this.currSubType = tileSubType.UNSET;
	}//End method
	public void SetNecessary()
	{
		this.currSubType = tileSubType.NECESSARY;
	}//End method

	public void SetIncludeSelf()
	{
		this.currSubType = tileSubType.INCLUDESELF;
	}//End method
	public void SetAtLeast()
	{
		this.currSubType = tileSubType.ATLEAST;
	}//End method
	public void SetBlank()
	{
		this.currSubType = tileSubType.BLANK;
	}//End method

	//~~~~~~~~~~~~ Cycle through player decisions ~~~~~~~~~~~~

	public void cycleThroughChoices()
	{
		switch (playersChoice)
		{
			case choice.UNDECIDED:
				playersChoice = choice.VALID;
				this.currColor = Color.cyan;
				GetComponent<MeshRenderer>().material.color = new Color(0.4f, 1, 1, 1);
				break;
			case choice.VALID:
				playersChoice = choice.INVALID;
				this.currColor = Color.red;
				GetComponent<MeshRenderer>().material.color = new Color(1, 0.5f, 0.5f, 1);
				break;
			case choice.INVALID:
				playersChoice = choice.UNDECIDED;
				this.currColor = Color.white;
				GetComponent<MeshRenderer>().material.color = Color.white;
				break;
			default:
				Debug.LogError("Somehow, a choice that isn't supposed to be on this hexagon is already active... No action taken.");
				break;
		}
	}

	//~~~~~~~~~~~~ Misc ~~~~~~~~~~~~

	public void resetTile()
	{
		this.playersChoice = choice.UNDECIDED;
		this.GetComponent<Renderer>().enabled = true;
		GetComponent<MeshRenderer>().material.color = Color.white;
		UnsetMain();
		UnsetSub();
	}

	public int getPlayersChoice()
	{
		return (int)playersChoice;
	}

	//~~~~~~~~~~~~ Set and Get NumAdjValidTiles ~~~~~~~~~~~~

	public void setNumAdjValidTiles(int inputNum)
	{
		this.numAdjValidTiles = inputNum;
	}//End method
	public int getNumAdjValidTiles()
	{
		return numAdjValidTiles;
	}//End method

	//~~~~~~~~~~~~ Set and Get coordinates ~~~~~~~~~~~~

	public void setQpos(float Q)
	{
		this.qpos = Q;
	}//End method
	public float getQpos()
	{
		return qpos;
	}//End method
	public void setRpos(float R)
	{
		this.rpos = R;
	}//End method
	public float getRpos()
	{
		return rpos;
	}//End method
	public void setSpos(float S)
	{
		this.spos = S;
	}//End method
	public float getSpos()
	{
		return spos;
	}//End method

	//~~~~~~~~~~~~ Set and Get coordinates ~~~~~~~~~~~~

	public string getType()
	{
		return this.currType.ToString();
	}
	public string getSubType()
	{
		return this.currSubType.ToString();
	}
}
