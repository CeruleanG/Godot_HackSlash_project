extends HitBox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damage *= Upgrade.dataDict[2]["Stat"][Upgrade.statDict[2]]
