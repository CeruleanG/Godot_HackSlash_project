extends EnemyState

@export var soul_scene: PackedScene
var center_point = Vector2(1720/2,750/2+100)
var retreat_pos: Vector2
var is_retreating: bool

func enter(context:Dictionary = {}) -> void:
	super()
	is_retreating = true
	retreat_pos = think_where_to_move()
	print_debug(retreat_pos)
	pass
	#animation.play("shooting")

func think_where_to_move()->Vector2:
	var result : Vector2
	var player_vector : Vector2= enemy.player.global_position - enemy.global_position
	var center_vector = center_point - enemy.global_position
	var retreat_vector = player_vector - player_vector.normalized() * 400
	var result_vector = center_vector * 0.3 + retreat_vector * 1.0
	result = result_vector + enemy.global_position
	return result

func physics_update(delta: float) -> void:
	if not is_retreating:
		return
	if (retreat_pos - enemy.global_position).length() <= 10 or is_stuck_on_arena():
		is_retreating = false
		animation.play("shooting")
	else:
		var direction := (retreat_pos - enemy.global_position).normalized()
		enemy.velocity = lerp(enemy.velocity, enemy.SPEED * direction, delta * enemy.ACCELERATION / 1)
	enemy.move_and_slide()

func spawn_souls(number: int):
	var obj
	for i in number:
		obj = soul_scene.instantiate()
		var interval = PI/4
		var angle_multiplier = pow(-1,i) * ((abs(i)+1)/2 as int)
		var mod = Vector2(180 * sin(angle_multiplier*interval), -180* cos(angle_multiplier*interval))
		obj.global_position = enemy.global_position + mod + Vector2(0,-10)
		obj.player = enemy.player
		add_child(obj)
		await get_tree().create_timer(0.2).timeout

func is_stuck_on_arena() -> bool:
	var result : bool
	var retreat_vector = retreat_pos - enemy.global_position
	if enemy.is_on_ceiling() and retreat_vector.y < 0:
		result = true
	elif  enemy.is_on_floor() and retreat_vector.y > 0:
		result = true
	elif enemy.is_on_wall() and ((center_point - enemy.global_position).x * retreat_vector.x)<0:
		result = true
	else:
		result = false
	return result


func on_animation_finished(anim_name: StringName):
	if anim_name == "shooting":
		await get_tree().create_timer(2).timeout
		Transition.emit(self,"idling")
