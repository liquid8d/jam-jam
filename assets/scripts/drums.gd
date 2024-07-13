extends Node3D

var kit 

func _ready():
	kit = [
		{ name = "Floor Tom", node = $DrumAArea, shaker = $drum_kit_separate/DrumA/ShakerComponent3D, voice = "midi.drum45", note = 24, length = 16 },
		{ name = "Snare", node = $DrumBArea, shaker = $drum_kit_separate/DrumB/ShakerComponent3D, voice = "valsound.percus30", note = 26, length = 16 },
		{ name = "Rack Tom", node = $DrumCArea, shaker = $drum_kit_separate/DrumC/ShakerComponent3D, voice = "midi.percus6", note = 30, length = 8 },
		{ name = "Rack Tom", node = $DrumDArea, shaker = $drum_kit_separate/DrumD/ShakerComponent3D, voice = "midi.percus6", note = 30, length = 16 },
		{ name = "Ride", node = $DrumEArea, shaker = $drum_kit_separate/DrumE/ShakerComponent3D, voice = "valsound.percus26", note = 48, length = 8 },
		{ name = "Hi-hat", node = $DrumFArea, shaker = $drum_kit_separate/DrumF/ShakerComponent3D, voice = "valsound.percus17", note = 70, length = 8 },
		{ name = "Crash", node = $DrumGArea, shaker = $drum_kit_separate/DrumG/ShakerComponent3D, voice = "valsound.percus8", note = 100, length = 8 },
		{ name = "Bass", node = $DrumHArea, shaker = $drum_kit_separate/DrumH/ShakerComponent3D, voice = "valsound.percus1", note = 19, length = 8 }
	]
	for drum in kit:
		print(drum)
		if drum.node:
			drum.node.body_entered.connect(play_on_enter.bindv([drum]))

func play_on_enter(body:Node3D, drum):
	if drum.has("voice"):
		JamJam.set_voice(drum.voice)
	if drum.has("shaker"):
		(drum.shaker as ShakerComponent3D).play_shake()
	JamJam.play(drum.note, drum.length)
