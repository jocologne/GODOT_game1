extends Area2D

@export var coin_scene: PackedScene
var was_hit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if not was_hit:
		was_hit = true
		var coin = coin_scene.instantiate()
		coin.global_position = global_position + Vector2(0, -14)
		get_tree().current_scene.add_child(coin)
		get_parent().get_node("sprite_base").visible = false
		get_parent().get_node("sprite_hit").visible = true
	pass # Replace with function body.
