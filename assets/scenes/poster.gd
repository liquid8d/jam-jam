@tool
extends Node3D

@onready var picture_mesh: MeshInstance3D = %Picture
@export var picture:Texture2D : set = set_picture

func _ready():
	set_picture(picture)

func set_picture(value):
	picture = value
	if picture_mesh:
		var mat = picture_mesh.get_active_material(0)
		if not mat:
			mat = StandardMaterial3D.new()
			mat.resource_local_to_scene = true
		mat.albedo_texture = picture
		if picture_mesh:
			picture_mesh.set_surface_override_material(0, mat)
