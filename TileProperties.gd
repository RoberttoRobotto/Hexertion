extends Node3D
var Qcoord #Q Coordinate
var Rcoord #R Coordinate
var Scoord #S Coordinate
var North = true #Side 0/North
var NorthEast = true #Side 1/NorthEast
var SouthEast = true #Side 2/SouthEast
var South = true #Side 5/SouthEast
var SouthWest = true #Side 4/SouthEast
var NorthWest = true #Side 3/SouthEast
@export var GameTileType = 'G' #Game Tile types: G = GameBoard, B = Border
var dir = 'N' #Current Direction, North is default/unrotated
@export var toCompleteNum = 6 #Number on front and back of the tile
var currAdjTallyTiles = 0 #Current number of Adjacent Tally Tiles
@export var PlayerReserve = '0' #Player who starts with this tile
@export var Placed = false #Is the tile placed
@export var Complete = false #Is the tile complete
