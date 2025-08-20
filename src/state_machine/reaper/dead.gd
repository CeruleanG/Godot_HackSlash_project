extends EnemyState


func enter(context:Dictionary = {}) -> void:
	super()
	animation.play("dead")
	



func on_animation_finished(anim_name: StringName):
	if anim_name == "dead":
		enemy.death_occurred.emit()
		enemy.queue_free()
