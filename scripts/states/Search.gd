extends "res://scripts/states/State.gd"

func update(delta):
	if host.target_sight:
		var angle_to = get_angle_to(host.target_sight.position)
		
		if angle_to > PI/16:
			rotate(PI/32)
		elif angle_to < -PI/16:
			rotate(-PI/32)
		else:
			look_at(host.target_sight.position)
	else:
		return 'idle'