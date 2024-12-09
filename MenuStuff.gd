extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# SlideIn function
func SlideIn(container: VBoxContainer):
	# Set initial position offscreen on the left side
	container.rect_min_size = Vector2.ZERO
	container.rect_pivot_offset = Vector2(0, 0.5)
	container.rect_position.x = -get_viewport().get_viewport_rect().size.x / 2 - container.rect_size.x / 2
	container.show()
	
	# Tween for smooth animation
	var tween = Tween.new()
	add_child(tween)
	
	# Define animation properties
	tween.interpolate_property(container, "rect_position:x", container.rect_position.x, 0)
	tween.interpolate_property(container, "rect_scale", Vector2.ZERO, Vector2(1, 1))
	tween.interpolate_property(container, "rect_size:x", 0, container.rect_size.x)
	tween.interpolate_property(container, "rect_pivot_offset:x", container.rect_pivot_offset.x, 0)
	tween.interpolate_property(container, "rect_min_size:x", 0, container.rect_size.x)
	tween.easing = Tween.EASE_OUT
	
	# Set duration and start tween
	tween.start()
	await tween.signal

# SlideOut function
func SlideOut(container: VBoxContainer):
	# Tween for smooth animation
	var tween = Tween.new()
	add_child(tween)
	
	# Define animation properties
	tween.interpolate_property(container, "rect_position:x", container.rect_position.x, get_viewport().get_viewport_rect().size.x)
	tween.interpolate_property(container, "rect_scale", Vector2(1, 1), Vector2.ZERO)
	tween.interpolate_property(container, "rect_size:x", container.rect_size.x, 0)
	tween.interpolate_property(container, "rect_pivot_offset:x", container.rect_pivot_offset.x, 1)
	tween.interpolate_property(container, "rect_min_size:x", container.rect_size.x, 0)
	tween.easing = Tween.EASE_IN
	
	# Set duration and start tween
	tween.start()
	await tween.signal
	
	# Hide container after animation
	container.hide()
