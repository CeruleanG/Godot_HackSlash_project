extends EnemyState

@onready var idle_timer: Timer = $IdleTimer
var idle_time_array = [2.0, 2.5, 3.0]
@onready var hurt_animation: CharacterAnimationPlayer = $"../../HurtAnimation"

func enter(context:Dictionary = {}) -> void:
	super()
	animation.play("idling")
	idle_timer.start(randome_time())

func randome_time():
	idle_time_array.shuffle()
	return idle_time_array.front()



func exit() -> void:
	super()
	idle_timer.stop()



func frame_update(delta: float) -> void:
	pass



func physics_update(delta: float) -> void:
	
	enemy.move_and_slide()



func on_receiving_hit (context: Dictionary):
	if enemy.is_dead:
		Transition.emit(self,"dead")


func _on_idle_timer_timeout() -> void:
	#Transition.emit(self,"attacking")
	pass
