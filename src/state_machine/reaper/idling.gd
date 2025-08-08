extends EnemyState

@onready var idle_timer: Timer = $IdleTimer
var idle_time_array = [1.0, 1.5, 2.0]

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
	enemy.velocity = lerp(enemy.velocity, Vector2.ZERO , delta * enemy.ACCELERATION * 5)
	enemy.move_and_slide()



func on_receiving_hit (context: Dictionary):
	if enemy.is_dead:
		Transition.emit(self,"dead")

var ticking : int = 0
func _on_idle_timer_timeout() -> void:
	#Transition.emit(self,["moving","shooting"].pick_random())
	#Transition.emit(self,"moving")
	#Transition.emit(self,"shooting")
	
	ticking = (ticking + 1)%2
	var table : Array = ["moving","shooting"]
	Transition.emit(self,table[ticking])
	
	pass
