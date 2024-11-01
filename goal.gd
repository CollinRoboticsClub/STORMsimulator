extends Area3D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if not body.is_in_group("robot"): return
	Robotstats.score += Robotstats.bawlcount*2
	Robotstats.bawlcount = 0
