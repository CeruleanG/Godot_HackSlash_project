extends HitBox


func turn_off_collision ():
	for child in get_children():
		if child is CollisionShape2D:
			child.set_deferred("disabled",true)

func turn_on_collision ():
	for child in get_children():
		if child is CollisionShape2D:
			child.set_deferred("disabled",false)
