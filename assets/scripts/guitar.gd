extends Node3D
@onready var pick_area: Area3D = $PickArea

var kit
var voice = "alsound.guitar10"

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
		{ node = $Key14, note = 33, length = 16  }
	]
	# TODO we want to store pressed frets, and only play when pick hits PickArea
	for fret in kit:
		print(fret)
		if fret.node:
			fret.node.body_entered.connect(play_on_enter.bindv([fret.note, fret.length]))
	
	pick_area.body_entered.connect(play_on_enter.bindv([40, 16]))

func play_on_enter(body:Node3D, note, length):
	#if body.is_in_group("guitar_pick"):
	print("body entered!")
	JamJam.set_voice(voice)
	JamJam.play(note, length)
	#else:
		#print("body entered, but not a pick")
