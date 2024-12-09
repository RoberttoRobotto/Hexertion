extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _onBorderTilespressed() -> void:
	print("Border Tiles Checkbox Pressed.\nThe value of the Border Checkbox is now:", get_node("GameplayModifierOptions/BorderTilesCheckBox").is_pressed())
	pass # Replace with function body.

func _onMixedTilespressed() -> void:
	print("Mixed Tiles Checkbox Pressed.\nThe value of the Mixed Checkbox is now:", get_node("GameplayModifierOptions/MixedTilesCheckBox").is_pressed())
	pass # Replace with function body.
