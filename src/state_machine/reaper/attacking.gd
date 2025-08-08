extends EnemyState


func enter(context:Dictionary = {}) -> void:
	super()
	var facing = sign(enemy.player.position.x - enemy.position.x)
	if facing == 0:
		facing = 1
	animation.flip_sprite(facing)
	animation.play("attack")
	



func exit() -> void:
	super()



func frame_update(delta: float) -> void:
	pass



func physics_update(delta: float) -> void:
	pass

func on_animation_finished(anim_name: StringName):
	if anim_name == "attack":
		Transition.emit(self,"idling")
