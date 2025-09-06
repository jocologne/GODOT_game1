extends Area2D

var ARROW_SPEED := 100

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.x = position.x + ARROW_SPEED * delta
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.queue_free()
		queue_free()
	pass # Replace with function body.
