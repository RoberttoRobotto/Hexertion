extends Node3D

#var HexTileScene = load("res://Prefabs/HexagonTilePrefabv2.tscn") #HexagonPrefabScene
var HexTileScene = load("res://Prefabs/HitboxPrefab.tscn")
#var HexGridHolder = get_node("GameplayHandling/HitboxHolder")

var xConst = 2.1
var yConst = 1.2
var radius = 4
var AllHitBoxes = Node3D.new()

# Called when the node enters the scene tree for the first time.
func generateGrid():
	self.add_child(AllHitBoxes)
	print("Generating the Hitbox Hex tile map")
	print("self = ", self)
	print("get_node()", get_node("EventHandler/HitboxHolder"))
	for q in range(-radius, radius+1):
		var s
		var r
		var HitBoxHolder = self
		var HitBoxHolder2 = get_node("AllHitBoxes")
		var HitBoxHolder3 = $AllHitBoxes
		var HitBoxHolder4 = get_node('AllHitBoxes')
		var HitBoxHolder5 = get_node("./DebugScene/AllHitBoxes")
		var HitBoxHolder6 = get_node("root/DebugScene/AllHitBoxes")
		
		print("\n\n")
		self.print_tree_pretty()
		self.print_tree()
		print("\n\n")
		
		print("HitBoxHolder = ", HitBoxHolder)
		print("HitBoxHolder2 = ", HitBoxHolder2)
		print("HitBoxHolder3 = ", HitBoxHolder3)
		print("HitBoxHolder4 = ", HitBoxHolder4)
		print("HitBoxHolder5 = ", HitBoxHolder5)
		print("HitBoxHolder6 = ", HitBoxHolder6)
		
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
			print($AllHitBoxes)
			HitBoxHolder = $AllHitBoxes
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
			HitBoxHolder.add_child(HitBoxPlacement)
			$AllHitBoxes.add_child(HitBoxPlacement)
			get_node("AllHitBoxes").add_child(HitBoxPlacement)
			
#			self.add_child(HitBoxPlacement)
#			self.get_child(0).add_child(HitBoxPlacement)
#			HitBoxHolder2.add_child(HitBoxPlacement)
#			self.add_child(HitBoxPlacement)
#			get_node("EventHandler/HitboxHolder").add_child(HitBoxPlacement)
			
	pass
