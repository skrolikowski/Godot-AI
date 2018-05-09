extends Node2D

var Soldier = preload('res://entities/Soldier.tscn')

func _ready():
	var soldier

	for spawn in $SpawnPoints.get_children():
		soldier = Soldier.instance()
		soldier.position   = spawn.position
		soldier.navigation = $Navigation2D

		$SoldierContainer.add_child(soldier)

func _input(event):
	if event.is_action_pressed('trigger'):
		for soldier in $SoldierContainer.get_children():
			soldier.target_heard = event.position
			
	if event.is_action_pressed('ui_cancel'):
		get_tree().quit()
