class_name EnemyState
extends State

var enemy : CharacterBody2D

func enter(context:Dictionary = {}) -> void:
	super()
	enemy.receive_hit.connect(on_receiving_hit)

func exit() -> void:
	super()
	enemy.receive_hit.disconnect(on_receiving_hit)

func on_receiving_hit (context: Dictionary):
	pass

func on_animation_finished(anim_name: StringName):
	pass
