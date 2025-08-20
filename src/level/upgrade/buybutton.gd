extends Button

@onready var price: Label = $"../../Price"
@onready var item: VBoxContainer = $"../../../.."

func _process(delta: float) -> void:
	var current_level = Upgrade.statDict[item.key]
	if current_level >= Upgrade.dataDict[item.key]["Max_Level"]:
		self.disabled = true
		return
	var current_price = Upgrade.dataDict[item.key]["Cost"][Upgrade.statDict[item.key]]
	self.disabled = current_price > Upgrade.gold

func _on_pressed() -> void: # buy button pressed
	Upgrade.gold -= Upgrade.dataDict[item.key]["Cost"][Upgrade.statDict[item.key]]
	Upgrade.statDict[item.key] += 1
	item._ready()
