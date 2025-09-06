extends CanvasLayer

@onready var label: Label = $Label

func _ready() -> void:
	print("Label is in tree:", label.is_inside_tree())
	label.custom_minimum_size = Vector2(200, 5)
	label.text = "PAUSED"
	label.visible = false

func _process(delta: float) -> void:
	center_label_to_camera()
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			label.visible = true
			await get_tree().process_frame
			get_tree().paused = true
		else:
			label.visible = false
			await get_tree().process_frame
			get_tree().paused = false
	pass
	
func center_label_to_camera():
	var viewport_size = get_viewport().get_visible_rect().size
	var label_size = label.get_size()
	label.position = (viewport_size - label_size) / 2
