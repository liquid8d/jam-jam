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
	{ name = "valsound.lead1", label = "Aco code", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead2", label = "Analog synthe 1", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead3", label = "Bosco-lead", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead4", label = "Cosmo Lead", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead5", label = "Cosmo Lead 2", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead6", label = "Digital lead #1", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead7", label = "Double sin wave", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead8", label = "E.Organ 2 bright", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead9", label = "E.Organ 2 (voice)", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead10", label = "E.Organ 4 Click", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead11", label = "E.Organ 5 Click", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead12", label = "E.Organ 6", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead13", label = "E.Organ 7 Church", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead14", label = "Metal Lead", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead15", label = "Metal Lead 3", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead16", label = "MONO Lead", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead17", label = "PSG like PC88 (long)", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead18", label = "PSG Cut 1", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead19", label = "Attack Synth", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead20", label = "Sin wave", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead21", label = "Synth, Bell 2", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead22", label = "Chorus #2(Voice)+bell", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead23", label = "Synth Cut 8-4", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead24", label = "Synth long 8-4", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead25", label = "ACO_Code #2", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead26", label = "ACO_Code #3", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead27", label = "Synth FB long 4", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead28", label = "Synth FB long 5", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead29", label = "Synth Lead 0", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead30", label = "Synth Lead 1", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead31", label = "Synth Lead 2", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead32", label = "Synth Lead 3", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead33", label = "Synth Lead 4", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead34", label = "Synth Lead 5", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead35", label = "Synth Lead 6", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead36", label = "Synth Lead 7 (Soft FB)", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead37", label = "Synth PSG", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead38", label = "Synth PSG 2", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead39", label = "Synth PSG 3", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead40", label = "Synth PSG 4", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead41", label = "Synth PSG 5", type = "LEAD", instrument = "keyboard" },
	{ name = "valsound.lead42", label = "Sin water synth", type = "LEAD", instrument = "keyboard" },
	{ name = "drumkit.1", label = "Simple Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "drumkit.2", label = "SiON Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "drumkit.3", label = "Midi Drumkit", type = "DRUMKIT", instrument = "drums" },
	{ name = "valsound.lead2", label = "Default", type = "LEAD", instrument = "guitar" },
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
# guitar F.Strings 1, Steel Guitar
# bass Chopper Bass 3, Finger Bass, Banjo (Harpci), Sin water synth, F.Strings 4

var driver := SiONDriver.create()
var preset := SiONVoicePresetUtil.new()
var voice:SiONVoice
var left_controller:XRController3D
var right_controller:XRController3D
var _instrument = ""

var _current_voice = "" :
	set(value):
		if _current_voice != value:
			_current_voice = value
			voice = preset.get_voice_preset(value)

func _ready() -> void:
	add_child(driver)

	# start the driver
	driver.play(null, false)
	
	find_controllers()
	
	## Test Pattern
	#driver.play("t100 l8 [ ccggaag4 ffeeddc4 | [ggffeed4]2 ]2")
	#await get_tree().create_timer(3).timeout
	#for i in range(30, 120):
##		valsound.percus25 65, 71, 85
		#set_voice("valsound.percus25", "drums")
		#play(i, 2000)
		#await get_tree().create_timer(1).timeout

func play(note, length:float = 16):
	print("play note %s on %s" % [note, _current_voice])
	driver.volume
	driver.note_on(note, voice, length)
	#driver.play("t100 l8 [ ccggaag4 ffeeddc4 | [ggffeed4]2 ]2")

func find_controllers():
	var player = get_node("/root/Room/XrPlayer")
	left_controller = XRHelpers.get_left_controller(player)
	right_controller = XRHelpers.get_right_controller(player)

func haptics(body):
	#print("try haptics with body: ", body.name)
	if body.has_meta("hand"):
		if not left_controller or not right_controller:
			find_controllers()
		match body.get_meta("hand"):
			"left":
				if left_controller:
					#print("left haptic!")
					left_controller.trigger_haptic_pulse("haptic", 0.1, 0.1, 0.2, 0.2)
			"right":
				if right_controller:
					#print("right haptic!")
					right_controller.trigger_haptic_pulse("haptic", 0.1, 0.1, 0.2, 0.2)

func set_voice(voice:String, instrument:String = ""):
	_instrument = instrument
	_current_voice = voice
