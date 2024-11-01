extends Control








func _process(delta):
	Robotstats.move_force = $VBoxContainer/speedslider.value
	Robotstats.turn_force = $VBoxContainer/turnslider.value
	$Label.text = str(Robotstats.bawlcount)
	$score.text = "Score: "+str(Robotstats.score)
