@tool
class_name Mannequin
extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	var animations: Array[String] = []
	animations.assign(animation_player.get_animation_list())
	animation_player.play(animations.pick_random())
