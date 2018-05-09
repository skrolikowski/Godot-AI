extends "res://scripts/states/State.gd"

func update(delta):
	if host.target_sight:
		return 'aim'
	elif host.target_heard:
		return 'search'
	else:
		host.velocity *= 0