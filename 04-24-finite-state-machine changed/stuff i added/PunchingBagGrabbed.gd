extends "res://player/states/state.gd"

var control

func enter():
	owner.get_node("AnimationPlayer").play("grabbed")
	
func update(delta):
	#print(owner.knockback_amount)
	var collision_info = move(owner.knockback_amount, owner.knockback_direction)
	if not collision_info:
		return
	#if speed == MAX_RUN_SPEED and collision_info.collider.is_in_group("environment"):
		#return null

func move(speed, direction):
	owner.set_global_position(owner.control.get_global_position())
	#owner.get_node("BodyPivot").set_global_position(owner.grabbedPos.get_global_position())
#	owner.move_and_slide(velocity, Vector2(), 5, 2)
#	if owner.get_slide_count() == 0:
#		return
#	return owner.get_slide_collision(0)

##see hitstop
#func _on_animation_finished(anim_name):
#	emit_signal("finished", "idle")

#might work but needs to call deferred right now the hitstop enables the physics body call_deferred()
func exit():
	owner.grabbedPos = null
	#owner.get_node('CollisionShape2D").set_disabled(false)

