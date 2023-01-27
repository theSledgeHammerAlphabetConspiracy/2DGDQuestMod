extends "../motion/on_ground/on_ground.gd"

func enter():
	owner.get_node("AnimationPlayer").play("knockdown")

func handle_input(event):
	pass
#	return .handle_input(event)

func update(_delta):
	pass
#	var input_direction = get_input_direction()
#	if input_direction:
#		emit_signal("finished", "move")


func _on_animation_finished(anim_name):
	emit_signal("finished", "idle")
