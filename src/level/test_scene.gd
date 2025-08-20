extends Node

@onready var player: CharacterBody2D = $player
@onready var reaper: CharacterBody2D = $Reaper

var start_time
var end_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Ui.heart.toggle_visible(true)
	Ui.fade_transition.fade_to_bright()
	AudioController.play_sound("Combat")
	player.death_occurred.connect(on_death_occurred)
	reaper.death_occurred.connect(on_victory)
	start_time = Time.get_unix_time_from_system()

func on_death_occurred():
	end_time = Time.get_unix_time_from_system()
	var elapsed_time : int = (end_time - start_time)
	var reaper_percent_health : float = reaper.health.health / reaper.health.max_health
	Upgrade.gold += clamp(elapsed_time,0,90) + (1.0 - reaper_percent_health) * 30
	Upgrade.cumulated_gold += clamp(elapsed_time,0,90) + (1.0 - reaper_percent_health) * 30
	Upgrade.cumulated_combat_time += elapsed_time
	Upgrade.defeat_count += 1
	AudioController.stop_sound("Combat")
	get_tree().change_scene_to_file("res://src/level/upgrade/upgrade_menu.tscn")

func on_victory	():
	end_time = Time.get_unix_time_from_system()
	var elapsed_time : int = (end_time - start_time)
	var reaper_percent_health : float = reaper.health.health / reaper.health.max_health
	Upgrade.gold += clamp(elapsed_time,0,90) + (1.0 - reaper_percent_health) * 30
	Upgrade.cumulated_gold += clamp(elapsed_time,0,90) + (1.0 - reaper_percent_health) * 30 + 30
	Upgrade.cumulated_combat_time += elapsed_time
	Upgrade.victory_count += 1
	AudioController.stop_sound("Combat")
	get_tree().change_scene_to_file("res://src/level/upgrade/upgrade_menu.tscn")
