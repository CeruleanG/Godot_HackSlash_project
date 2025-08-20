extends EnemyState

var chasing_target : Vector2
var chasing_vec : Vector2


func enter(context:Dictionary = {}) -> void:
	super(context) 
	chasing_target = enemy.player.global_position
	if chasing_target.y < 375: #upper limit + collision height
		chasing_target.y = 375
	chasing_vec = chasing_target - enemy.global_position
	animation.flip_sprite(sign(chasing_vec.x))



func exit() -> void:
	super()



func frame_update(delta: float) -> void:
	pass



func physics_update(delta: float) -> void:
	if (chasing_target - enemy.global_position).length() <= 90:
		Transition.emit(self,"attacking")
		return
	var direction := chasing_vec.normalized()
	var distance := chasing_vec.length()
	enemy.velocity = lerp(enemy.velocity, enemy.SPEED * direction, delta * enemy.ACCELERATION / 1)
	chasing_vec = chasing_target - enemy.global_position
	
	enemy.move_and_slide()
