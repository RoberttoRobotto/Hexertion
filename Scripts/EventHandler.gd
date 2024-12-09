extends Node

#var HexTileScene = load("res://Prefabs/HexagonTilePrefabv2.tscn") #HexagonPrefabScene
var HexTileScene = load("res://Prefabs/HitboxPrefab.tscn")
#Node var hitboxHold = get_node("EventHandler/HitboxHolder")

var xConst = 2.1
var yConst = 1.2
var radius = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#HitboxHolder = get_node("EventHandler/HitboxHolder")
	#Generate the hitbox grid
	generateGrid()
	pass

# Called when the node enters the scene tree for the first time.
func generateGrid():
	
	print("Creating the Hex tile map")
	for q in range(-radius, radius+1):
		var s
		var r
		
		if sign(q) == -1:
			s = radius
			r = -(abs(radius)-abs(q))
		else:
			s = radius - q
			r = -radius
		
		print("q = ",q)
		print("r = ",r)
		print("s = ",s)

		var n1 = s
		var n2 = r
		for n3 in range(n1, n2-1, -1):
			print("Creating Hex Tile "+str(q)+","+str(r)+","+str(s))
			var HitBoxPlacement = HexTileScene.instantiate()
			
			HitBoxPlacement.scale = Vector3(1,1,1)
			HitBoxPlacement.name = str(str(q)+","+str(r)+","+str(s))
			HitBoxPlacement.set_position(Vector3(-q*xConst,0,(s-r)*yConst))
			
			if abs(q)==radius || abs(r)==radius || abs(s)==radius: #Is the hitbox a border placement only tile?
				HitBoxPlacement.placementType = "B"
				HitBoxPlacement.neighbors = "None"
			else:
				HitBoxPlacement.placementType = "G"
				HitBoxPlacement.neighbors = [str(q,",",r-1,",",s+1),str(q+1,",",r-1,",",s),str(q+1,",",r,",",s-1),str(q,",",r+1,",",s-1),str(q-1,",",r+1,",",s),str(q-1,",",r,",",s+1)]
			
			r += 1
			s -= 1
			$HitboxHolder.add_child(HitBoxPlacement)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
