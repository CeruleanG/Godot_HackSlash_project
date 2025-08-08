extends EnemyState

@onready var hit_box: Area2D = $"../../Sprite2D/HitBox"

# Called when the node enters the scene tree for the first time.
func enter(context:Dictionary = {}) -> void:
	super(context)
	hit_box.turn_off_collision()
	animation.play("death")


func on_animation_finished(anim_name: StringName):
	if anim_name == "death":
		enemy.queue_free()
