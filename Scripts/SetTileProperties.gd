extends Node

const BLUE = Color.BLUE
const BLUE2 = Color(0,90,255,255)
const RED = Color.RED
const RED2 = Color(0,90,255,255)
const GREEN = Color.GREEN
const GREEN2 = Color(30,255,30,255)
const CYAN = Color.CYAN
const CYAN2 = Color(0,255,125,255)

func setTallyTile(new_tile) -> void:
	setBasicTile(new_tile,BLUE)
	pass

func setExemptTile(new_tile) -> void:
	setBasicTile(new_tile,RED)
	pass

func ssss(new_tile) -> void:
	setBasicTile(new_tile,GREEN)
	pass

func setBorderTallyTile(new_tile) -> void:
	setBasicTile(new_tile,CYAN)
	pass

func setBasicTile(new_tile, colorToChangeTo) -> void:
	var tileToChangeColor = new_tile.get_node("HexagonPieces/HexagonTile")
	tileToChangeColor.get_surface_override_material(0).albedo_color = colorToChangeTo
	pass

func setMixedGame5Tile(new_tile) -> void:
	setMixedSegments(new_tile,RED,BLUE,BLUE,BLUE,BLUE,BLUE)
	pass

func setMixedGame6Tile(new_tile) -> void:
	setMixedSegments(new_tile,BLUE,RED,BLUE,BLUE,BLUE,RED)
	pass

func setMixedSegments(new_tile,s0,s1,s2,s3,s4,s5) -> void:
	var segmentP0 = new_tile.get_node("HexagonPieces/PartialSide/0")
	var segmentC0 = new_tile.get_node("HexagonPieces/CompleteSide/0")
	var segmentP1 = new_tile.get_node("HexagonPieces/PartialSide/1")
	var segmentC1 = new_tile.get_node("HexagonPieces/CompleteSide/1")
	var segmentP2 = new_tile.get_node("HexagonPieces/PartialSide/2")
	var segmentC2 = new_tile.get_node("HexagonPieces/CompleteSide/2")
	var segmentP3 = new_tile.get_node("HexagonPieces/PartialSide/3")
	var segmentC3 = new_tile.get_node("HexagonPieces/CompleteSide/3")
	var segmentP4 = new_tile.get_node("HexagonPieces/PartialSide/4")
	var segmentC4 = new_tile.get_node("HexagonPieces/CompleteSide/4")
	var segmentP5 = new_tile.get_node("HexagonPieces/PartialSide/5")
	var segmentC5 = new_tile.get_node("HexagonPieces/CompleteSide/5")
	
	segmentP0.get_surface_override_material(0).albedo_color = s0
	segmentC0.get_surface_override_material(0).albedo_color = s0
	segmentP1.get_surface_override_material(0).albedo_color = s1
	segmentC1.get_surface_override_material(0).albedo_color = s1
	segmentP2.get_surface_override_material(0).albedo_color = s2
	segmentC2.get_surface_override_material(0).albedo_color = s2
	segmentP3.get_surface_override_material(0).albedo_color = s3
	segmentC3.get_surface_override_material(0).albedo_color = s3
	segmentP4.get_surface_override_material(0).albedo_color = s4
	segmentC4.get_surface_override_material(0).albedo_color = s4
	segmentP5.get_surface_override_material(0).albedo_color = s5
	segmentC5.get_surface_override_material(0).albedo_color = s5
	pass
