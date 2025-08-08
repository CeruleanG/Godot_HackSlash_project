extends EnemyState

func on_animation_finished(anim_name: StringName):
	if anim_name == "spawning":
		Transition.emit(self,"tracking")
