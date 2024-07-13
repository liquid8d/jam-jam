@tool
extends Panel

@onready var grid_container: GridContainer = %GridContainer
@onready var label: Label = %Label

@export var instrument:String = "keyboard" : set = set_instrument

func _ready() -> void:
	set_instrument(instrument)

func set_instrument(value):
	instrument = value
	if label:
		label.text = value.to_upper()
		update_presets()

func update_presets():
	for child in grid_container.get_children():
		child.free()

	for item in JamJam.presets:
		if item.instrument == instrument:
			var btn = Button.new()
			btn.custom_minimum_size = Vector2(128, 96)
			btn.name = item.name
			btn.text = item.label
			btn.pressed.connect(_on_voice_select.bindv([item.name]))
			grid_container.add_child(btn)
			btn.owner = self

func _on_voice_select(name:String):
	JamJam.set_voice(name)
