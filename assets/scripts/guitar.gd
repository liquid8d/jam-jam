extends Node3D

# TODO on fret collision for each string, store highest fret currently pressed
var kit

var frets:Array = [ [], [], [], [], [], [] ]

func _ready() -> void:
	for string in range(1, 7):
		# connect each string to play string on collision
		var string_name = "Pick" + str(string)
		if has_node(string_name):
			var string_node:Area3D = get_node(string_name)
			if string_node:
				print("connect string ", string)
				string_node.body_entered.connect(_play_string.bindv([string]))
				# connect each fret to note_on/note_off
				for fret_num in range(1, 25):
					## listen for frets
					var fret_name = "String" + str(string) + "/Key" + str(fret_num)
					if has_node(fret_name):
						var fret:Area3D = get_node(fret_name)
						if fret:
							print("   connected string %s fret %s" % [string, fret_num])
							fret.body_entered.connect(_fret_on.bindv([ string, fret_num ]))
							fret.body_exited.connect(_fret_off.bindv([ string, fret_num ]))
						else:
							print_rich("[color=red]missing string %s fret %s[/color]" % [string, fret_num])

func _fret_on(body, string:int, fret:int):
	# HACK can't find why guitar body collider is colliding with frets/string colliders
	if body.name == "GuitarPickableObject":
		return
	if body.name == "PokeBody" or body.is_in_group("PlayerHands"): 
		if not frets[string - 1].has(fret):
			frets[string - 1].append(fret)
			print_rich("fret_on: string [color=green]%s[/color]  fret [color=blue]%s[/color]" % [string, fret])
	else:
		print("body hit fret, but not playerhands")
		print(body)

func _fret_off(body, string:int, fret:int):
	# HACK can't find why guitar body collider is colliding with frets/string colliders
	if body.name == "GuitarPickableObject":
		return
	if body.name == "PokeBody" or body.is_in_group("PlayerHands"):
		# remove note
		if frets[string - 1].has(fret):
			var pos = frets[string - 1].find(fret)
			frets[string - 1].remove_at(pos)
			print_rich("fret_off: string [color=red]%s[/color]  note [color=blue]%s[/color]" % [string, fret])
	else:
		print("body off fret, but not playerhands")
		print(body)

func _play_string(body, string:int):
	# HACK can't find why guitar body collider is colliding with frets/string colliders
	if body.name == "GuitarPickableObject":
		return
	if body.name == "PokeBody" or body.is_in_group("PlayerHands") or body.is_in_group("guitar_pick"):
		const starting_note = 0
		# TODO if no fret pressed, first note on string
		# get highest fret on string that is currently pressed
		frets[string - 1].sort()
		var fret = frets[string - 1].size()
		var note = starting_note + string * fret + ((string - 1) * 24)
		print_rich("[color=orange]string pick: %s[/color] fret: [color=green]%s[/color] note [color=blue]%s[/color]" % [string, fret, note])
		play_note(note)
		JamJam.haptics(body)
	else:
		print("body hit string, but not playerhands or guitar pick")
		print(body)

func play_note(note, length = 16):
	if not JamJam._current_voice:
		JamJam.set_voice("valsound.lead2", "guitar")
	JamJam.play(note, length)
