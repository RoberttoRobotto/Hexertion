extends Node

@export var raycast_length = 10.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var raycast = $RayCast3D
	pass # Replace with function body.

func generateRayCast(): #Generate a rayvast variable
#	raycast.cast_to = transform.basis.z * raycast_length
	pass

func flipTiles():
	var raycast = $RayCast3D
	#Generate a RayCast
#	if RayCast3D.is_colliding():
		
	if raycast.is_colliding():
		var collided_body = raycast.get_collider()
		
		if collided_body.is_in_group("gameTile"):
			collided_body.rotation.x += PI #Flip 180 degrees around X-axis
	
	raycast.queue_free()
	pass

func destroyRayCast():
#	raycast.queue_free()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
