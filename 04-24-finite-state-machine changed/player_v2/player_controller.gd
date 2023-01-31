extends KinematicBody2D

signal direction_changed(new_direction)#connected to the weapon pivot script

export var player_team: String = "1"

var look_direction = Vector2(1, 0) setget set_look_direction

var knockback_direction := Vector2()
var knockback_amount : float = 0.0

var string_series: int = 0

func _ready():
	add_to_group("player"+player_team)
	#print(get_tree().get_nodes_in_group('player1'))

func take_damage(attacker, amount, kb_D, kb_A= 200, effect=null):
	#print("take damage in player controller is ran")
	
	#if self.is_a_parent_of(attacker):#this was the original
	if attacker.is_in_group("player"+player_team):
		return
	
	knockback_amount = kb_A
	knockback_direction = kb_D
	
	#$States/Hitstop.knockback_direction = knockback
	#$States/Hitstop.knockback_direction = (attacker.global_position - global_position).normalized()#this might be nice for DI
	
	$Health.take_damage(amount, effect)
	
	$StateMachine._change_state("hitstop")

func set_dead(value):
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionPolygon2D.disabled = value

func set_look_direction(value):
	look_direction = value
	emit_signal("direction_changed", value)


func _on_ABox_area_entered(area):
	print('hit')
