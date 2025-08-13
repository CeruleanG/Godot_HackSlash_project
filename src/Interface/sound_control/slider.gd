extends HSlider

@export var bus_name : String
var bus_index: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value = AudioServer.get_bus_volume_linear(bus_index)
	value_changed.connect(on_changed)
	



func on_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(bus_index,value)
