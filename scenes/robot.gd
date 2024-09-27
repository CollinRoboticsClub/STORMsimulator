extends RigidBody3D



var mode = true
@export var move_force = 50
@export var rotation_force = 0.5



func _physics_process(delta):
	if Input.is_action_just_pressed("toggle"): mode = !mode
	
	if mode:
		strafe_movement()
	else:
		tank_movement()
		
	


func strafe_movement():
	
	
	if Input.is_action_pressed("forward"):
		apply_central_force(-transform.basis.z*move_force)
	if Input.is_action_pressed("back"):
		apply_central_force(transform.basis.z*move_force)
	
	if Input.is_action_pressed("left"):
		apply_central_force(-transform.basis.x*move_force)
	if Input.is_action_pressed("right"):
		apply_central_force(transform.basis.x*move_force)

func tank_movement():
	if Input.is_action_pressed("forward"):
		apply_central_force(-transform.basis.z*move_force)
	if Input.is_action_pressed("back"):
		apply_central_force(transform.basis.z*move_force)
	
	if Input.is_action_pressed("left"):
		angular_velocity.y += rotation_force
	if Input.is_action_pressed("right"):
		angular_velocity.y -= rotation_force



