extends Node

@export var placementType = "U"
@export var neighbors = ['Unset','Unset','Unset','Unset','Unset','Unset']
@export var currTile = "Unset"
@export var playable = false
@export var numAdjTallyTiles = 0

func _on_hitbox_mouse_entered() -> void:
	#if playable == true
	$HexagonPiece.visible = true
	pass # Replace with function body.9

func _on_hitbox_mouse_exited() -> void:
	$HexagonPiece.visible = false
	pass # Replace with function body.
