extends Node

#@export var theGrid = GridMap.new()
#var tallyCountNum = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var q = 0
	var r = 0
	var s = 0
	var origin = str(0,0,0)
	var origin2 = str(q,",",r,",",s)
	var test = [str(0,0-1,0+1),str(0+1,0-1,0),str(0+1,0,0-1),str(0,0+1,0-1),str(0-1,0+1,0),str(0-1,0,0+1)]
	var test2 = [str(q,r-1,s+1),str(q+1,r-1,s),str(q+1,r,s-1),str(q,r+1,s-1),str(q-1,r+1,s),str(q-1,r,s+1)]
	var test3 = [str(q,",",r-1,",",s+1),str(q+1,",",r-1,",",s),str(q+1,",",r,",",s-1),str(q,",",r+1,",",s-1),str(q-1,",",r+1,",",s),str(q-1,",",r,",",s+1)]
	print("origin = ",origin)
	print("origin2 = ",origin2)
	print("test = ",test)
	print("test2 = ",test2)
	print("test3 = ",test3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
