extends Control
@export var addBorderTilesCheckbox: CheckBox

var addBorderTiles = false

# Called when the node enters the scene tree for the first time.
func _ready():
#	addBorderTilesCheckbox.connect("toggled", self, "_on_checkbox_toggled")
	
	
	
	
	var doMenuStuff = get_node("MainMenu")
	var useThis = get_script().MenuStuff
	doMenuStuff.SlideIn($OptionsMenu)
	var tryThis = get_node("MenuStuff")
	var yetAgain = get_node_and_resource("")
	var animation_controller = get_node("AnimationController")
	pass
#	animation_controller.SlideIn($VBoxContainer)
#	animation_controller.SlideOut($VBoxContainer)
	
#	tryThis.SlideIn($MainMenu)
#	tryThis.SlideOut(get_parent())



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	pass # Replace with function body.

func _on_options_button_pressed():
	$OptionsMenu.Transform()
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()

func _on_puzzle_mode_button_pressed():
	var transitions = get_node("MenuStuff")
	transitions.SlideIn($PuzzleModeMenu)
	transitions.SlideOut($MainMenu)

	pass # Replace with function body.

func _on_competitive_button_pressed():
	var transitions = get_node("MenuStuff")
	transitions.SlideIn($CompetitiveModeMenu)
	transitions.SlideOut($MainMenu)
	pass # Replace with function body.
func _on_back_button_pressed():
	var transitions = get_node("MenuStuff")
	transitions.SlideIn($MainMenu)
	transitions.SlideOut(get_parent())
#	useThis.SlideOut()
#	doMenuStuff.SlideOut(get_parent())
#	SlideIn($MainMenu)
	
	
	pass # Replace with function body.
func _on_checkbox_toggled(button_pressed):
#	Global.addBorderTiles = button_pressed
	pass
