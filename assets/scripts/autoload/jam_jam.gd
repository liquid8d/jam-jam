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
	{ name = "valsound.piano1", label = "Aco Piano2 (Attack)", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano2", label = "Backing 1 (Clav.)", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano3", label = "Clav. coad", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano4", label = "Deep Piano 1", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano5", label = "Deep Piano 3", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano6", label = "E.piano #2", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano7", label = "E.piano #3", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano8", label = "E.piano #4(2+)", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano9", label = "E.(Bell)Piano #5", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano10", label = "E.Piano #6", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano11", label = "E.Piano #7", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano12", label = "Harpci chord 1", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano13", label = "Harpci 2", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano14", label = "Piano1 (ML1,10,05,01)", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano15", label = "Piano3", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano16", label = "Piano4", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano17", label = "Digital Piano #5", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano18", label = "Piano 6 High-tone", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano19", label = "Panning Harpci", type = "PIANO", instrument = "keyboard" },
	{ name = "valsound.piano20", label = "Yam Harpci chord", type = "PIANO", instrument = "keyboard" },
	{ name = "drumkit.1", label = "Simple Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "drumkit.2", label = "SiON Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "drumkit.3", label = "Midi Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "midi.guitar1", label = "Nylon", type = "MIDI", instrument = "guitar" },
	{ name = "midi.guitar2", label = "Steel", type = "MIDI", instrument = "guitar" },
	{ name = "midi.guitar3", label = "Jazz", type = "MIDI", instrument = "guitar" },
	{ name = "midi.guitar4", label = "Electric", type = "MIDI", instrument = "guitar" },
	{ name = "midi.guitar5", label = "Muted", type = "MIDI", instrument = "guitar" },
	{ name = "midi.guitar6", label = "Overdrive", type = "MIDI", instrument = "guitar" },
	{ name = "midi.guitar7", label = "Distorted", type = "MIDI", instrument = "guitar" },
	{ name = "midi.guitar8", label = "Harmonics", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass1", label = "Acoustic Bass", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass2", label = "Finger Bass", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass3", label = "Pick Bass", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass4", label = "Fretless Bass", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass5", label = "Slap Bass 1", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass6", label = "Slap Bass 2", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass7", label = "Synth Bass 1", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass8", label = "Synth Bass 2", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass8", label = "Synth Bass 2", type = "MIDI", instrument = "guitar" },
	{ name = "midi.bass8", label = "Synth Bass 2", type = "MIDI", instrument = "guitar" },
	{ name = "valsound.guitar1", label = "Guitar VeloLow", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar2", label = "Guitar VeloHigh", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar3", label = "A.Guitar #3", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar4", label = "Cutting E.Guitar", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar5", label = "Dis. Synth (old)", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar6", label = "Dra-spi-Dis.G.", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar7", label = "Dis.Guitar 3-", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar8", label = "Dis.Guitar 3+", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar9", label = "Feed-back Guitar 1", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar10", label = "Hard Dis. Guitar 1", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar11", label = "Hard Dis.Guitar 3", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar12", label = "Dis.Guitar '94 Hard", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar13", label = "New Dis.Guitar 1", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar14", label = "New Dis.Guitar 2", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar15", label = "New Dis.Guitar 3", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar16", label = "Overdrive.G. (AL=013)", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar17", label = "METAL", type = "GUITAR", instrument = "guitar" },
	{ name = "valsound.guitar18", label = "Soft Dis.Guitar", type = "GUITAR", instrument = "guitar" },
]

var driver := SiONDriver.create()
var preset := SiONVoicePresetUtil.new()
var voice:SiONVoice

var _current_voice = "" :
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
