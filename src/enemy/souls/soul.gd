extends CharacterBody2D

@export var player : CharacterBody2D

@onready var free_timer: Timer = $free_timer

signal receive_hit

const SPEED = 600
const ACCELERATION = 10

func _ready() -> void:
	free_timer.start()

func _on_free_timer_timeout() -> void:
	queue_free()
