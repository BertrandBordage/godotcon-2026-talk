@tool
extends Node3D

@export_tool_button("Toggle Animation") var toggle_animation_action = toggle_animation
@onready var body: MeshInstance3D = $BodyVat
@onready var clothes: MeshInstance3D = $ClothesVat


func toggle_animation() -> void:
	body.set_instance_shader_parameter("playing", not body.get_instance_shader_parameter("playing"))
	clothes.set_instance_shader_parameter("playing", not clothes.get_instance_shader_parameter("playing"))
