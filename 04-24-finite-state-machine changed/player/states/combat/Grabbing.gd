extends "../motion/on_ground/on_ground.gd"

export(float) var MAX_WALK_SPEED = 450
export(float) var MAX_RUN_SPEED = 700

export var chargeable: bool = false
export var stringadd:bool = true
#var series: int = 0 #moved to player
export var advance: bool = false
var locked_direction:= Vector2()
export var locked_speed:float=0.0
var chargespeed:float=0.0

func enter():
	locked_speed = 100
	velocity = Vector2()
	#locked_direction = Vector2(owner.get_node("BodyPivot").get_scale().x,0)
	#update_look_direction(locked_direction)
	owner.get_node("AnimationPlayer").play("grabbing")
	
func handle_input(event):
	#this is done cause you dont wanna be able to jump outta the string
	if event.is_action_pressed("special"+owner.player_team):
		emit_signal("finished","special")
	#return .handle_input(event)
#
func update(delta):
	#pummel
	if Input.is_action_pressed("stringA"+owner.player_team):
		emit_signal("finished","throw")
			
	var input_direction = get_input_direction()
	move(locked_speed,input_direction)
	
func move(speed, direction):
	#velocity = direction.normalized() * speed
	velocity = (direction.normalized()*Vector2(1,.5)) * speed
	owner.move_and_slide(velocity, Vector2(), 5, 2)
	if owner.get_slide_count() == 0:
		return
	return owner.get_slide_collision(0)
	
#not sure if you want this to fime out or struggle out or w/e
#func _on_animation_finished(anim_name):
#	emit_signal("finished", "idle")
