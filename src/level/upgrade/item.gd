extends VBoxContainer

@export var key: int

func _ready() -> void:
	$details/Logo/icon.texture = Upgrade.dataDict[key]["icon"]
	$details/Purchase/Price.text = str(Upgrade.dataDict[key]["Cost"][Upgrade.statDict[key]])
	$stat.text = str(Upgrade.dataDict[key]["Description"][Upgrade.statDict[key]])
