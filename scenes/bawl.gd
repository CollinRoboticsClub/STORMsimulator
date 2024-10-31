extends RigidBody3D

var sizes = [load("res://bawl sizes/smallball.tres"), load("res://bawl sizes/medball.tres"), load("res://bawl sizes/largeball.tres")]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	print("siza changing")
	var rng = randi_range(0,2)
	$CollisionShape3D.shape = sizes[rng]
	
	$MeshInstance3D.mesh.radius = sizes[rng].radius
	$MeshInstance3D.mesh.height = sizes[rng].radius*2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
