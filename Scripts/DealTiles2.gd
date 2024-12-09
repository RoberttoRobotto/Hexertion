extends Node
var SetTiles = load("res://Scripts/SetTileProperties.gd")
var PlayerHand = load("res://Scripts/SetTileProperties.gd")
var MixedTilePrefab = load("res://Prefabs/HexagonTileMIXEDPrefab.tscn")
var BasicTilePrefab = load("res://Prefabs/HexagonTileBASICPrefab.tscn")
var TileList = [0,0,0,0,0,0,0,0,0,0] #TileList = T4, M5, M6, T5, T6, E6, BT5, BT6, BE5, BE6

# Called when the node enters he scene tree for the first time.
func DealTiles(numPlayers, withBorderTiles, withMixedTiles):
	if numPlayers == 2:
		print("2 Player Game selected")
		TileList = [6,7,5,7,3,2,1,2,1,3]
	else:
		print("3 Player Game selected")
		TileList = [4,5,3,5,2,1,1,1,1,2]
	
	for n in numPlayers:
		print("Setting player ",n+1,"s tiles...")
		if withMixedTiles == true:
			for m in TileList[0]:
				createBasicTile("T4", "Tally", 4, n)
			for m in TileList[1]:
				createMixedTile("M5", 5, n)
			for m in TileList[2]:
				createMixedTile("M6", 6, n)
		else:
			for m in TileList[0]:
				createBasicTile("T4", "Tally", 4, n)
			for m in TileList[3]:
				createBasicTile("T5", "Tally", 5, n)
			for m in TileList[4]:
				createBasicTile("T6", "Tally", 6, n)
			for m in TileList[5]:
				createBasicTile("E6", "Exempt", 6, n)
		if withBorderTiles == true:
			for m in TileList[6]:
				createBasicTile("BT5", "BorderTally", 5, n)
			for m in TileList[7]:
				createBasicTile("BT6", "BorderTally", 6, n)
			for m in TileList[8]:
				createBasicTile("BE5", "BorderExempt", 5, n)
			for m in TileList[9]:
				createBasicTile("BE6", "BorderExempt", 6, n)
		return 0
	
	return 1 #If a different number of players was selected,
	#The game will immediately suspend and throw an error

func createBasicTile(tileName, tileType, tileCompleteNum, playerHandNum):
	var newTile = BasicTilePrefab.instantiate()
	newTile.name = tileName
	
	match tileType:
		"Tally":
			SetTiles.setTallyTile(newTile)
		"Exempt":
			SetTiles.setExemptTile(newTile)
		"BorderTally":
			SetTiles.setBorderTallyTile(newTile)
		"BorderExempt":
			SetTiles.setBorderExemptTile(newTile)
	
	var partialTextNode = newTile.get_node("Decals/PartialTextNumber")
	partialTextNode = tileCompleteNum
	var completeTextNode = newTile.get_node("Decals/CompleteTextNumber")
	partialTextNode = tileCompleteNum
	
	newTile.transform = Vector3(0,0,0) #TODO: Move this to players hand based on n
	
	pass

func createMixedTile(tileName, tileCompleteNum, playerHandNum):
	var newTile = MixedTilePrefab.instantiate()
	newTile.name = tileName
	
	match tileCompleteNum:
		5:
			SetTiles.setMixedGame5Tile(newTile)
		6:
			SetTiles.setMixedGame6Tile(newTile)
	
	var partialTextNode = newTile.get_node("Decals/PartialTextNumber")
	partialTextNode = tileCompleteNum
	var completeTextNode = newTile.get_node("Decals/CompleteTextNumber")
	partialTextNode = tileCompleteNum
	
	newTile.transform = Vector3(0,0,0) #TODO: Move this to players hand based on n
	pass
