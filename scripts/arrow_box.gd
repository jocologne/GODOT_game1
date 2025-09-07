extends Area2D

@export var arrow_scene: PackedScene

var was_hit = false

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void:
	if not was_hit and body.name == "Player":
		was_hit = true
		var arrow = arrow_scene.instantiate()
		arrow.global_position = global_position + Vector2(0, -14)
		arrow.speed = 0
		arrow.auto_destroy = false
		arrow.rotation = -PI / 4.5
		get_tree().current_scene.add_child(arrow)
		get_parent().get_node("sprite_base").visible = false
		get_parent().get_node("sprite_hit").visible = true
	pass # Replace with function body.
