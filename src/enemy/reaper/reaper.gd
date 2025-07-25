extends CharacterBody2D

@onready var animation_player: CharacterAnimationPlayer = $AnimationPlayer
@onready var hurt_animation: CharacterAnimationPlayer = $HurtAnimation
@onready var progress_bar: ProgressBar = $CanvasLayer/VBoxContainer/HBoxContainer/ProgressBar
@onready var health: Health = $Health

signal receive_hit

var is_dead: bool = false
var invulnerable: bool = false
var invul_timer: Timer = Timer.new()
var invul_timer_value = 0.2

func _ready() -> void:
	receive_hit.connect(on_receive_hit)
	
	progress_bar.max_value = health.health
	progress_bar.value = progress_bar.max_value
	
	invul_timer.timeout.connect(on_invul_timeout)
	invul_timer.one_shot = true
	invul_timer.wait_time = invul_timer_value
	get_tree().root.add_child.call_deferred(invul_timer)
	

func on_receive_hit(context: Dictionary):
	invulnerable = true
	hurt_animation.play("hurt")
	progress_bar.value = health.health
	invul_timer.start()


func on_invul_timeout():
	invulnerable = false
