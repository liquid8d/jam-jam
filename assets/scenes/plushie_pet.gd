extends Area3D

@onready var shaker_component_3d: ShakerComponent3D = $ShakerComponent3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "PokeBody":
		shaker_component_3d.play_shake()
