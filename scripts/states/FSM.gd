extends Node

var host
var states = []

func _init(node, default_state):
	host = node
	
	if default_state:
		set_state(default_state)

func empty():
	return states.empty()

func reset():
	states.clear()
	
func set_state(state):
	if not empty():
		states.pop_front()
		
	states.push_front(state)
	state().enter(host)
	
func push_state(state):
	if state() != state:
		states.append(state)
	
func pop_state():
	states.pop_front()
	
	if not empty():
		state().enter(host)
	
func state():
	return host.state_map[states.front()]
	
func update(delta):
	if not empty():
		var new_state = state().update(delta)
		
		if new_state:
			set_state(new_state)
	
func draw():
	if not empty():
		host.get_node('CurrentState').text = state().name