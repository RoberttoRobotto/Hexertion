extends Node

var randIndex

#Set Tile as an exempt tile
func setExemptTiles(RemainingTiles, numExempt):
	for n in range(1,numExempt):
		randIndex = randi_range(0,RemainingTiles.Size())
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsBASIC()
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsEXEMPT()
		RemainingTiles[randIndex].Remove(randIndex)
	return RemainingTiles

#Set Tile as a border tile
func setBorderTiles(RemainingTiles, numBorder):
	for n in range(1,numBorder):
		randIndex = randi_range(0,RemainingTiles.Size())
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsBASIC()
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsEXEMPT()
		RemainingTiles[randIndex].Remove(randIndex)
	return RemainingTiles

#Set Tile as a blank tile
func setBlankTiles(RemainingTiles, numBlank):
	for n in range(1,numBlank):
		randIndex = randi_range(0,RemainingTiles.Size())
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsBASIC()
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsEXEMPT()
		RemainingTiles[randIndex].Remove(randIndex)
	return RemainingTiles

#Set Tile as a checkSelf tile
func setCheckSelfTiles(RemainingTiles, numCheckSelf):
	for n in range(1,numCheckSelf):
		randIndex = randi_range(0,RemainingTiles.Size())
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsBASIC()
		RemainingTiles[randIndex].getNode("/HexagonProperties").SetAsEXEMPT()
		RemainingTiles[randIndex].Remove(randIndex)
	return RemainingTiles

#Set Remining Tiles as Tally tiles
func setTallyTiles(RemainingTiles):
	for n in range(0,RemainingTiles.length() - 1 ):
		RemainingTiles[n].getNode("/HexagonProperties").SetAsBASIC()
		RemainingTiles[n].getNode("/HexagonProperties").SetAsTALLY()
	pass
