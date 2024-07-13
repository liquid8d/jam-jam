extends Node3D
@onready var keys_cast: ShapeCast3D = %KeysCast

var kit

func _ready() -> void:
	kit = [
		{ node = $Key1, note = 30, length = 16  },
		{ node = $Key2, note = 31, length = 16  },
		{ node = $Key3, note = 32, length = 16  },
		{ node = $Key4, note = 33, length = 16  },
		{ node = $Key5, note = 34, length = 16  },
		{ node = $Key6, note = 35, length = 16  },
		{ node = $Key7, note = 36, length = 16  },
		{ node = $Key8, note = 37, length = 16  },
		{ node = $Key9, note = 38, length = 16  },
		{ node = $Key10, note = 39, length = 16  },
		{ node = $Key11, note = 40, length = 16  },
		{ node = $Key12, note = 41, length = 16  },
		{ node = $Key13, note = 42, length = 16  },
		{ node = $Key14, note = 43, length = 16  },
		{ node = $Key15, note = 44, length = 16  },
		{ node = $Key16, note = 45, length = 16  },
		{ node = $Key17, note = 46, length = 16  },
		{ node = $Key18, note = 47, length = 16  },
		{ node = $Key19, note = 48, length = 16  },
		{ node = $Key20, note = 49, length = 16  },
		{ node = $Key21, note = 50, length = 16  },
		{ node = $Key22, note = 51, length = 16  },
		{ node = $Key23, note = 52, length = 16  },
		{ node = $Key24, note = 53, length = 16  },
		{ node = $Key25, note = 54, length = 16  },
		{ node = $Key26, note = 55, length = 16  },
		{ node = $Key27, note = 56, length = 16  },
		{ node = $Key28, note = 57, length = 16  },
		{ node = $Key29, note = 58, length = 16  },
		{ node = $Key30, note = 59, length = 16  },
		{ node = $Key31, note = 60, length = 16  },
		{ node = $Key32, note = 61, length = 16  },
		{ node = $Key33, note = 62, length = 16  },
		{ node = $Key34, note = 63, length = 16  },
		{ node = $Key35, note = 64, length = 16  },
		{ node = $Key36, note = 65, length = 16  },
		{ node = $Key37, note = 66, length = 16  },
		{ node = $Key38, note = 67, length = 16  },
		{ node = $Key39, note = 68, length = 16  },
		{ node = $Key40, note = 69, length = 16  },
		{ node = $Key41, note = 70, length = 16  },
		{ node = $Key42, note = 71, length = 16  },
		{ node = $Key43, note = 72, length = 16  },
		{ node = $Key44, note = 73, length = 16  },
		{ node = $Key45, note = 74, length = 16  },
		{ node = $Key46, note = 75, length = 16  },
		{ node = $Key47, note = 76, length = 16  },
		{ node = $Key48, note = 77, length = 16  },
		{ node = $Key49, note = 78, length = 16  },
		{ node = $Key50, note = 79, length = 16  },
		{ node = $Key51, note = 80, length = 16  },
		{ node = $Key52, note = 81, length = 16  },
	]

	for key in kit:
		print(key)
		if key.node:
			key.node.body_entered.connect(play_on_enter.bindv([key.note, key.length]))

func play_on_enter(body:Node3D, note, length):
	print("body entered!")
	JamJam.play(note, length)
