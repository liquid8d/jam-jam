extends Node3D

var kit 

func _ready():
	kit = [
		{ name = "Snare", node = $DrumAArea, voice = "bassdrumm", note = 50, length = 16 },
		{ name = "Snare", node = $DrumBArea, voice = "snare", note = 57, length = 16 },
		{ name = "Rack Tom", node = $DrumCArea, voice = "crash", note = 50, length = 16 },
		{ name = "Floor Tom", node = $DrumDArea, voice = "midi.drum30", note = 50, length = 8 },
		{ name = "Hi-hat", node = $DrumEArea, voice = "openedhh", note = 60, length = 8 },
		{ name = "Ride", node = $DrumFArea, voice = "midi.drum30", note = 50, length = 8 },
		{ name = "Crash", node = $DrumGArea, voice = "crash", note = 50, length = 8 },
		{ name = "Bass", node = $DrumHArea, voice = "bassdrumm", note = 30, length = 8 }
	]
	for drum in kit:
		print(drum)
		if drum.node:
			drum.node.body_entered.connect(play_on_enter.bindv([drum.voice, drum.note, drum.length]))

func play_on_enter(body:Node3D, voice, note, length):
	print("body entered!")
	JamJam.set_voice(voice)
	JamJam.play(note, length)
