extends Node3D
@onready var keys_cast: ShapeCast3D = %KeysCast

var kit = []

func _ready() -> void:
	const start_at = 10
	for i in range(1, 89):
		kit.append({ node = get_node("Key" + str(i + 1)), note = start_at + (i + 1), length = 16 })

	for key in kit:
		print(key)
		if key.node:
			key.node.body_entered.connect(play_on_enter.bindv([key.note, key.length]))

func play_on_enter(body:Node3D, note, length):
	if not JamJam._current_voice:
		JamJam.set_voice("midi.piano1", "keyboard")
	JamJam.play(note, length)
	JamJam.haptics(body)
