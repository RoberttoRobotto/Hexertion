extends Node
var SetTiles = load("res://Scripts/SetTileProperties.gd")
var PlayerHand = load("res://Scripts/SetTileProperties.gd")
var MixedTilePrefab = load("res://Prefabs/HexagonTileMIXEDPrefab.tscn")
var BasicTilePrefab = load("res://Prefabs/HexagonTileBASICPrefab.tscn")
var TileList = [0,0,0,0,0,0,0,0,0,0] #TileList = T4, M5, M6, T5, T6, E6, BT5, BT6, BE5, BE6

# Called when the node enters he scene tree for the first time.
func DealTiles(numPlayers, withBorderTiles, withMixedTiles):
	
	if numPlayers == 2: #Two Player Game
		print("2 Player Game selected")
		for n in 2:
			print("Setting player ",n,"s tiles...")
			if withMixedTiles == true:
				for m in 6:
					createBasicTile("T4", "Tally", 4, n)
				for m in 7:
					createMixedTile("M5", 5, n)
				for m in 5:
					createMixedTile("M6", 6, n)
			else:
				for m in 6:
					createBasicTile("T4", "Tally", 4, n)
				for m in 7:
					createBasicTile("T5", "Tally", 5, n)
				for m in 3:
					createBasicTile("T6", "Tally", 6, n)
				for m in 2:
					createBasicTile("E6", "Exempt", 6, n)
			if withBorderTiles == true:
				for m in 1:
					createBasicTile("BT5", "BorderTally", 5, n)
				for m in 2:
					createBasicTile("BT6", "BorderTally", 6, n)
				for m in 1:
					createBasicTile("BE5", "BorderExempt", 5, n)
				for m in 3:
					createBasicTile("BE6", "BorderExempt", 6, n)
		return 0
	
	if numPlayers == 3: #Three Player Game
		print("3 Player Game selected")
		for n in 3:
			print("Setting player ",n,"s tiles...")
			if withMixedTiles == true:
				for m in 4:
					createBasicTile("T4", "Tally", 4, n)
				for m in 5:
					createMixedTile("M5", 5, n)
				for m in 3:
					createMixedTile("M6", 6, n)
			else:
				for m in 4:
					createBasicTile("T4", "Tally", 4, n)
				for m in 5:
					createBasicTile("T5", "Tally", 5, n)
				for m in 2:
					createBasicTile("T6", "Tally", 6, n)
				for m in 1:
					createBasicTile("E6", "Exempt", 6, n)
			
			if withBorderTiles == true:
				for m in 1:
					createBasicTile("BT5", "BorderTally", 5, n)
				for m in 1:
					createBasicTile("BT6", "BorderTally", 6, n)
				for m in 1:
					createBasicTile("BE5", "BorderExempt", 5, n)
				for m in 2:
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
