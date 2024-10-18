extends RigidBody3D



var mode = true

@export var move_force = 50
@export var rotation_force = 0.5

func _ready():
	$CollisionShape3D.shape = Robotstats.sizes[Robotstats.size_index]



func _physics_process(delta):
	if Input.is_action_just_pressed("toggle"): mode = !mode
	
	move_force = Robotstats.move_force
	rotation_force = Robotstats.turn_force/10
	
	strafe_movement()
	
	


func strafe_movement():
	
	
	if Input.is_action_pressed("forward"):
		apply_central_force(-transform.basis.z*move_force)
	if Input.is_action_pressed("back"):
		apply_central_force(transform.basis.z*move_force)
	
	if Input.is_action_pressed("left"):
		apply_central_force(-transform.basis.x*move_force)
	if Input.is_action_pressed("right"):
		apply_central_force(transform.basis.x*move_force)
	
	if Input.is_action_pressed("turn_left"):angular_velocity.y += rotation_force
	if Input.is_action_pressed("turn_right"): angular_velocity.y -= rotation_force
	
	var ca = Networking.control_axis
	apply_central_force((transform.basis.z*move_force)*ca.x)
	apply_central_force((transform.basis.x*move_force)*ca.y)
	angular_velocity.y += rotation_force*ca.z




