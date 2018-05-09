extends KinematicBody2D


onready var state_map = {
	'idle': $States/Idle,
	'search': $States/Search
}
onready var fsm = FSM.new(self, 'idle')

const FSM = preload('res://scripts/states/FSM.gd')

export (int) var walk_speed = 100
export (int) var run_speed  = 300

var speed    = walk_speed
var target_sight = null
var target_heard = null setget update_path
var velocity = Vector2()
var navigation
var path = []

func _process(delta):
	fsm.update(delta)
	
	if velocity.length() > 0:
		position += velocity * speed * delta
		rotation = velocity.angle()
	
func _draw():
	fsm.draw()
	
func update_path(target):
	target_heard = target
	
	if target:
		path = navigation.get_simple_path(position, target, false)
	else:
		path.clear()

func _on_Sight_body_entered(body):
	if body.get_groups().has('soldiers'):
		target_sight = body

func _on_Sight_body_exited(body):
	if target_sight == body:
		target_sight = null

func _on_Sound_area_entered(area):
	pass # replace with function body


func _on_Sound_area_exited(area):
	pass # replace with function body
