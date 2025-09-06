extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.4
	timer.start()
	if body.has_method("die"):
		body.die()
	await get_tree().create_timer(0.2).timeout
	body.get_node("CollisionShape2D").queue_free()
	pass # Replace with function body.

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass # Replace with function body.
