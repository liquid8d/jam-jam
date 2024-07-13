extends Node3D

# TODO on fret collision for each string, store highest fret currently pressed
var kit
var voice = "alsound.guitar10"

var frets:Array = [ [], [], [], [], [], [] ]

func _ready() -> void:
	for x in range(0, 6):
		# connect each string to play string on collision
		var string_pick:Area3D = get_node("Pick" + str(x))
		if string_pick:
			print("connect string ", x)
			string_pick.body_entered.connect(_play_string.bindv([x]))
			# connect each fret to note_on/note_off
			for y in range(1, 25):
				## listen for frets
				var fret:Area3D = get_node("String" + str(x) + "/Key" + str(y))
				if fret:
					print("   connect fret: ", y)
					fret.body_entered.connect(_note_on.bindv([ x, (x + 1) * y ]))
					fret.body_exited.connect(_note_off.bindv([ x, (x + 1) * y ]))

func _note_on(body, string:int, note:int):
	if body.is_in_group("PlayerHands"):
		if not frets[string].has(note):
			frets[string].append(note)
			print_rich("note_on: string [color=green]%s[/color]  note [color=blue]%s[/color]" % [string, note])

func _note_off(body, string:int, note:int):
	if body.is_in_group("PlayerHands"):
		# remove note
		if frets[string].has(note):
			var pos = frets[string].find(note)
			frets[string].remove_at(pos)
			print_rich("note_off: string [color=red]%s[/color]  note [color=blue]%s[/color]" % [string, note])

func _play_string(body, string:int):
	if body.is_in_group("PlayerHands"):
		# get highest fret on string that is currently pressed
		var play_fret = frets[string].sort()[frets[string].length()]
		var note = (string + 1) * play_fret
		print_rich("[color=orange]string pick: %s[/color] note [color=blue]%s[/color]" % [string, note])
		play_note(note)

func play_note(note, length = 16):
	JamJam.set_voice(voice)
	JamJam.play(note, length)
