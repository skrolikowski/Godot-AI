extends "res://scripts/states/State.gd"

func update(delta):
	if host.target_heard:
		if host.path.size() > 0:
			var distance = host.position.distance_to(host.path[0])
				
			if distance > 5:
				host.velocity = (host.path[0] - host.position).normalized()
			else:
				host.path.remove(0)
	else:
		return 'idle'