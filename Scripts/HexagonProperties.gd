extends Node

enum TileType { BASIC, BLANK, BORDER, BACKGROUND }
#var TileTypeVar = TileType
@export var TileTypeVar = TileType.BASIC
enum TileSubType { UNSET, NECESSARY, INCLUDESELF, ATLEAST, EMPTY } #PUZZLE MODE ONLY
@export var TileSubTypeVar = TileSubType.UNSET
#var TileSubTypeVar
enum TileValidity { UNSET, TALLY, EXEMPT }
@export var TileValidityVar = TileValidity.UNSET
# var TileValidityVar
enum PlayerChoice { UNSET, TALLY, EXEMPT } #PUZZLE MODE ONLY
@export var PlayerChoiceVar = PlayerChoice.UNSET
# var PlayerChoiceVar
@export var qPos: int = 0 #Q position
@export var rPos: int = 0 #R position
@export var sPos: int = 0 #S position
var num #COMPETITIVE MODE ONLY - the number represents the number on the tile.
var numAdjTallyTiles
var isComplete = false

# ~~~~ Set Tile Type ~~~~

func SetAsBASIC():
	TileTypeVar = self.TileType.BASIC
	pass

func SetAsBLANK():
	TileTypeVar = self.TileType.BLANK
	pass

func SetAsBORDER():
	TileTypeVar = self.TileType.BORDER
	pass

func SetAsBACKGROUND():
	TileTypeVar = self.TileType.BACKGROUND
	pass

# ~~~~ Set Tile SubType ~~~~ #PUZZLE MODE ONLY

func SetAsUNSET():
	TileSubTypeVar = self.TileSubType.UNSET
	pass

func SetAsNECESSARY():
	TileSubTypeVar = self.TileSubType.NECESSARY
	pass
	
func SetAsINCLUDESELF():
	TileSubTypeVar = self.TileSubType.INCLUDESELF
	pass
	
func SetAsATLEAST():
	TileSubTypeVar = self.TileSubType.ATLEAST
	pass

func SetAsEMPTY():
	TileSubTypeVar = self.TileSubType.EMPTY
	pass

# ~~~~ Set Tile Validity ~~~~

func SetAsTALLY():
	TileValidityVar = self.TileValidity.TALLY
	pass
	
func SetAsEXEMPT():
	TileValidityVar = self.TileValidity.EXEMPT
	pass
	
func UnsetValidity():
	TileValidityVar = self.TileValidity.UNSET
	pass

# ~~~~ Utility Functions ~~~~

func setNumAdjTallyTiles(inputNum):
	self.numAdjTallyTiles = inputNum
	pass

func getNumAdjTallyTiles():
	return numAdjTallyTiles

func setQpos(q):
	self.qPos = q
	pass

func getQpos(q):
	return self.qPos

func setRpos(r):
	self.rPos = r
	pass

func getRpos():
	return self.rPos

func setSpos(s):
	self.sPos = s
	pass

func getSpos():
	return self.sPos

func getTileType():
	return self.TileType

func getTileSubType():
	return self.TileType

func getTileValidity():
	return self.TileValidity
