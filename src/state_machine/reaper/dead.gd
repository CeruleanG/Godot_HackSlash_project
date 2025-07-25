extends EnemyState


func enter(context:Dictionary = {}) -> void:
	super()
	animation.play("dead")
	




func exit() -> void:
	super()



func frame_update(delta: float) -> void:
	pass



func physics_update(delta: float) -> void:
	pass
