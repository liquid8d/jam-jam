extends Node3D
@onready var keys_cast: ShapeCast3D = %KeysCast

var kit

func _ready() -> void:
	kit = [
		{ node = $Key1, note = 20, length = 16  },
		{ node = $Key2, note = 21, length = 16  },
		{ node = $Key3, note = 22, length = 16  },
		{ node = $Key4, note = 23, length = 16  },
		{ node = $Key5, note = 24, length = 16  },
		{ node = $Key6, note = 25, length = 16  },
		{ node = $Key7, note = 26, length = 16  },
		{ node = $Key8, note = 27, length = 16  },
		{ node = $Key9, note = 28, length = 16  },
		{ node = $Key10, note = 29, length = 16  },
		{ node = $Key11, note = 30, length = 16  },
		{ node = $Key12, note = 31, length = 16  },
		{ node = $Key13, note = 32, length = 16  },
		{ node = $Key14, note = 33, length = 16  },
		{ node = $Key15, note = 34, length = 16  },
		{ node = $Key16, note = 35, length = 16  },
		{ node = $Key17, note = 36, length = 16  },
		{ node = $Key18, note = 37, length = 16  },
		{ node = $Key19, note = 38, length = 16  },
		{ node = $Key20, note = 39, length = 16  },
		{ node = $Key21, note = 40, length = 16  },
		{ node = $Key22, note = 41, length = 16  },
		{ node = $Key23, note = 42, length = 16  },
	]
	for key in kit:
		print(key)
		if key.node:
			key.node.body_entered.connect(play_on_enter.bindv([key.note, key.length]))

func play_on_enter(body:Node3D, note, length):
	print("body entered!")
	JamJam.play(note, length)
