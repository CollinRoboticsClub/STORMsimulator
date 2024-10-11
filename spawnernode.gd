extends Node3D

@export var spread_multiplier = 2
@onready var timer = $Timer
var bawl = load("res://scenes/bawl.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var b = bawl.instantiate()
	add_child(b)
	b.global_position = global_position
	var randos = Vector2(randi_range(-10,10),randi_range(-10,10))*spread_multiplier
	b.apply_central_force(Vector3(randos.x,200,randos.y))
