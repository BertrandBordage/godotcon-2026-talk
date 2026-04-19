@tool
extends Node3D


@export_tool_button("Toggle Animation") var toggle_animation_action = toggle_animation


func toggle_animation() -> void:
	for child in get_children():
		child.toggle_animation()
