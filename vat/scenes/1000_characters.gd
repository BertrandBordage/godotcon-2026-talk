@tool
extends Node3D

@export_tool_button("Toggle Animation") var toggle_animation_action = toggle_animation
@export_range(1, 4_000, 1, "prefer_slider") var count := 1_024:
	set(value):
		count = value
		set_multimesh_transforms(body_multimesh)
		set_multimesh_transforms(clothes_multimesh)
		set_multimesh_transforms(eyes_multimesh)
@onready var body_multi_mesh_instance: MultiMeshInstance3D = $BodyMultiMeshInstance
@onready var clothes_multi_mesh_instance: MultiMeshInstance3D = $ClothesMultiMeshInstance
@onready var eyes_multi_mesh_instance: MultiMeshInstance3D = $EyesMultiMeshInstance
@onready var body_multimesh: MultiMesh = body_multi_mesh_instance.multimesh
@onready var clothes_multimesh: MultiMesh = clothes_multi_mesh_instance.multimesh
@onready var eyes_multimesh: MultiMesh = eyes_multi_mesh_instance.multimesh


func toggle_animation() -> void:
	for multi_mesh_instance in [
		body_multi_mesh_instance, clothes_multi_mesh_instance, eyes_multi_mesh_instance,
	]:
		multi_mesh_instance.set_instance_shader_parameter(
			"playing",
			not multi_mesh_instance.get_instance_shader_parameter("playing")
		)


func set_multimesh_transforms(multimesh: MultiMesh) -> void:
	var size := roundi(sqrt(count))
	multimesh.instance_count = count
	for i in count:
		multimesh.set_instance_transform(
			i, Transform3D().translated(
				Vector3(
					-floorf(size / 2.0) + i % size,
					0,
					-floorf(size / 2.0) + floorf(i / float(size)),
				) * 2.0
			)
		)
