extends Node3D

const presets = [
	{ name = "midi.piano1", label = "Grand Piano", type = "MIDI", instrument = "keyboard" },
	{ name = "midi.piano2", label = "Bright Piano", type = "MIDI", instrument = "keyboard" },
	{ name = "midi.piano3", label = "Electric Grand", type = "MIDI", instrument = "keyboard" },
	{ name = "midi.piano4", label = "Honky Tonk", type = "MIDI", instrument = "keyboard" },
	{ name = "midi.piano5", label = "Electric Piano 1", type = "MIDI", instrument = "keyboard" },
	{ name = "midi.piano6", label = "Electric Piano 2", type = "MIDI", instrument = "keyboard" },
	{ name = "midi.piano7", label = "Harpsichord", type = "MIDI", instrument = "keyboard" },
	{ name = "midi.piano8", label = "Clavi", type = "MIDI", instrument = "keyboard" },
	{ name = "drumkit.1", label = "Simple Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "drumkit.2", label = "SiON Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "drumkit.3", label = "Midi Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "valsound.guitar18", label = "Soft Distortion", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar9", label = "Feed-back", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar17", label = "METAL", type = "GUITAR", instrument = "guitar" },
]

var driver := SiONDriver.create()
var preset := SiONVoicePresetUtil.new()
var voice:SiONVoice
var _current_voice = "midi.guitar4" :
	set(value):
		if _current_voice != value:
			_current_voice = value
			voice = preset.get_voice_preset(value)

func _ready() -> void:
	add_child(driver)
	
	# start the driver
	driver.play(null, false)
	
	## Test Pattern
	#set_voice("bassdrumm")
	#driver.play("t100 l8 [ ccggaag4 ffeeddc4 | [ggffeed4]2 ]2")
	#await get_tree().create_timer(3).timeout
	#for i in range(45, 61):
		#set_voice("bassdrumm")
		#play(i)
		#await get_tree().create_timer(1).timeout
	
func play(note, length:float = 64):
	print("play note %s on %s" % [note, _current_voice])
	driver.volume
	driver.note_on(note, voice, length)
	#driver.play("t100 l8 [ ccggaag4 ffeeddc4 | [ggffeed4]2 ]2")

func set_voice(voice:String):
	_current_voice = voice
