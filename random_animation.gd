@tool
extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export_tool_button("Toggle Animation") var toggle_animation_action = toggle_animation

func _ready() -> void:
	var animations: Array[String] = []
	animations.assign(animation_player.get_animation_list())
	animation_player.play(animations.pick_random())


func toggle_animation() -> void:
	animation_player.active = not animation_player.active
