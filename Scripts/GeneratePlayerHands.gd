extends Node
var PlayerHandScene = load("res://Prefabs/HitboxPrefab.tscn")

func generateHands(numPlayers):
	for n in numPlayers:
		
		var PlayerHandPrefab = PlayerHandScene.instantiate()
		
		match n:
			1:
				var setColor = PlayerHandPrefab.get_node("CompleteBorder")
				setColor.get_surface_override_material(0).albedo_color = Color.RED
				PlayerHandPrefab.transform = Vector3(5,2,5)
			2:
				var setColor = PlayerHandPrefab.get_node("CompleteBorder")
				setColor.get_surface_override_material(0).albedo_color = Color.BLUE
				PlayerHandPrefab.transform = Vector3(0,2,5)
			3:
				var setColor = PlayerHandPrefab.get_node("CompleteBorder")
				setColor.get_surface_override_material(0).albedo_color = Color.GREEN
				PlayerHandPrefab.transform = Vector3(-5,2,5)
	pass
