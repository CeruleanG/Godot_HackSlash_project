extends HurtBox

@onready var health_obj: Health = $"../../Health"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = Upgrade.dataDict[3]["Stat"][Upgrade.statDict[3]]
	health_obj._ready()
	
