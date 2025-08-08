extends EnemyState

var chasing_target : Vector2
var chasing_vec : Vector2

@onready var hit_box: Area2D = $"../../Sprite2D/HitBox"

func enter(context:Dictionary = {}) -> void:
	super(context) 
	animation.play("idling")
	
	hit_box.body_entered.connect(on_hit)
	chasing_target = enemy.player.global_position
	chasing_vec = (chasing_target - enemy.global_position).normalized()
	animation.flip_sprite(sign(chasing_vec.x))



func exit() -> void:
	super()


func frame_update(delta: float) -> void:
	pass



func physics_update(delta: float) -> void:
	enemy.velocity = lerp(enemy.velocity, enemy.SPEED * chasing_vec, delta * enemy.ACCELERATION / 1)
	
	enemy.move_and_slide()


func on_hit(body: Node2D) -> void:
	Transition.emit(self,"dead")
