extends Node3D

var driver := SiONDriver.create()
var preset := SiONVoicePresetUtil.new()
var voice:SiONVoice
var _current_voice = "midi.guitar4" : set = set_voice
#valsound.piano1

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

func set_voice(value):
	if _current_voice != value:
		_current_voice = value
		voice = preset.get_voice_preset(value)
