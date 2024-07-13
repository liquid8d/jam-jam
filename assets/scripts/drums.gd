extends Node3D

var kit 

func _ready():
	kit = [
		{ name = "Floor Tom", node = $DrumAArea, voice = "midi.drum45", note = 24, length = 16 },
		{ name = "Snare", node = $DrumBArea, voice = "valsound.percus30", note = 26, length = 16 },
		{ name = "Rack Tom", node = $DrumCArea, voice = "midi.percus6", note = 30, length = 8 },
		{ name = "Rack Tom", node = $DrumDArea, voice = "midi.percus6", note = 30, length = 16 },
		{ name = "Ride", node = $DrumEArea, voice = "valsound.percus26", note = 48, length = 8 },
		{ name = "Hi-hat", node = $DrumFArea, voice = "valsound.percus17", note = 70, length = 8 },
		{ name = "Crash", node = $DrumGArea, voice = "valsound.percus8", note = 100, length = 8 },
		{ name = "Bass", node = $DrumHArea, voice = "valsound.percus1", note = 19, length = 8 }
	]
	for drum in kit:
		print(drum)
		if drum.node:
			drum.node.body_entered.connect(play_on_enter.bindv([drum.voice, drum.note, drum.length]))

func play_on_enter(body:Node3D, voice, note, length):
	if voice:
		JamJam.set_voice(voice)
	JamJam.play(note, length)
