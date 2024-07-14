extends Node3D

var kit 

func _ready():
	kit = [
		{ name = "Floor Tom", node = $DrumAArea, shaker = $drum_kit_separate/DrumA/ShakerComponent3D, voice = "midi.drum41", note = 10, length = 8 },
		{ name = "Snare", node = $DrumBArea, shaker = $drum_kit_separate/DrumB/ShakerComponent3D, voice = "valsound.percus30", note = 20, length = 8 },
		{ name = "Rack Tom", node = $DrumCArea, shaker = $drum_kit_separate/DrumC/ShakerComponent3D, voice = "midi.percus6", note = 30, length = 8 },
		{ name = "Rack Tom", node = $DrumDArea, shaker = $drum_kit_separate/DrumD/ShakerComponent3D, voice = "midi.percus6", note = 30, length = 16 },
		{ name = "Ride", node = $DrumEArea, shaker = $drum_kit_separate/DrumE/ShakerComponent3D, voice = "valsound.percus25", note = 70, length = 64 },
		{ name = "Hi-hat", node = $DrumFArea, shaker = $drum_kit_separate/DrumF/ShakerComponent3D, voice = "valsound.percus17", note = 70, length = 16 },
		{ name = "Crash", node = $DrumGArea, shaker = $drum_kit_separate/DrumG/ShakerComponent3D, voice = "valsound.percus8", note = 48, length = 32 },
		{ name = "Bass", node = $DrumHArea, shaker = $drum_kit_separate/DrumH/ShakerComponent3D, voice = "valsound.percus1", note = 20, length = 16 }
	]
	# valsound.percus24/25 for ride?
	for drum in kit:
		if drum.node:
			drum.node.body_entered.connect(play_on_enter.bindv([drum]))

func play_on_enter(body:Node3D, drum):
	#print("play on enter: ")
	#print (drum.name)
	#print(body)
	if drum.has("kit"):
		JamJam.set_voice(drum.kit)
	elif drum.has("voice"):
		JamJam.set_voice(drum.voice)
	elif not JamJam._current_voice:
		JamJam.set_voice("drumkit.1")
	JamJam.play(drum.note, drum.length)
	if drum.has("shaker"):
		(drum.shaker as ShakerComponent3D).play_shake()
	JamJam.haptics(body)

func _on_drumstick_grabbed(pickable: Variant, by: Variant) -> void:
	print("drumstick picked up", by.name)
	if by.has_meta("hand"):
		pickable.set_meta("hand", by.get_meta("hand"))

func _on_drumstick_released(pickable: Variant, by: Variant) -> void:
	var node:Node3D
	print("drumstick released: ", by.name)
	if pickable.has_meta("hand"):
		pickable.remove_meta("hand")
