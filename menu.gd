extends Control



func start():
	
	if $VBoxContainer/OptionButton.selected != -1:
		Robotstats.size_index = $VBoxContainer/OptionButton.selected
	else:
		Robotstats.size_index = 0

	get_tree().change_scene_to_file("res://scene.tscn")
