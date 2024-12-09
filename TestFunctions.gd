extends Node

var HexTileScene = load("res://Prefabs/HexagonTilePrefabv2.tscn")

# Helper function to set the color of a MeshInstance3D
#func _set_mesh_color(mesh_instance: MeshInstance3D, color: Color):
# Get the existing material or create a new SpatialMaterial
#	var material = mesh_instance.get_surface_material(0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	
	var new_tile = HexTileScene.instantiate()
	new_tile.scale = Vector3(.1,.1,.1)
	new_tile.name = "TileName"
#	new_tile.get_node("Label3D").text = str("5")
	new_tile.toCompleteNum = str("5")
	var partial_text_node = new_tile.get_node("Decals/PartialTextNumber")
	partial_text_node.text = "5"
	var complete_text_node = new_tile.get_node("Decals/CompleteTextNumber")
	complete_text_node.text = "5"
	new_tile.set_position(Vector3(3,0,0))
	
	var segmentP0 = new_tile.get_node("HexagonPieces/PartialSide/0")
#	var complete_side_0 = new_tile.get_node("HexagonPieces/CompleteSide/0")
#	_set_mesh_color(complete_side_0, Color(1, 1, 1, 1))
#	var partial_side_0 = new_tile.get_node("HexagonPieces/PartialSide/0")
#	_set_mesh_color(partial_side_0, Color(1, 1, 1, 1))  # Set to white
	
#	segmentP0.albedo_color = Color(1,1,1,1)
	segmentP0.get_surface_override_material(0).albedo_color = Color(1,1,1,1)
	
	
	
	
#	new_tile.get_node($PartialTextNumber).text = str("5")
#	new_tile.get_node("HolderTest/HexagonPrefab/Decals/PartialTextNumber").text = str("5")
#	new_tile.get_node("HexagonPrefab/Decals/CompleteTextNumber").text = str(5)
	self.add_child(new_tile)
	pass # Replace with function body.

#func _init() -> void:
#	var new_tile = HexTileScene.instance().new()
#	add_child(new_tile)
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
