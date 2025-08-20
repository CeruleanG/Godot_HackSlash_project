extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(
		"Time spent in Combat : \n        ", str(Upgrade.cumulated_combat_time/60),"m",str(Upgrade.cumulated_combat_time%60),"s", "\n",
		"Total gold earned : \n        ", str(Upgrade.cumulated_gold), "\n",
		"Total defeat : \n        ", str(Upgrade.defeat_count), "\n",
		"Total Victory : \n        ", str(Upgrade.victory_count)
	)
