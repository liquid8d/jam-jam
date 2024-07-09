extends Node3D
@onready var frets_cast: ShapeCast3D = %FretsCast
@onready var body_cast: ShapeCast3D = %BodyCast

func _physics_process(delta: float) -> void:
	pass
	# TODO detect pressed frets (max 4) from collision points?
	# TODO detect picking on body from collision points?
