extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var coin_scene: PackedScene

@export var dist := 0
@export var speed:= 0
@export var dir := Vector2.RIGHT

var start_position: Vector2

func _ready() -> void:
	animated_sprite.flip_h = false
	start_position = position

func _process(delta: float) -> void:
	position.x += speed * delta * dir.x
	if (position - start_position).length() >= dist:
		dir.x *= -1
		animated_sprite.flip_h = true
	if (position <= start_position):
		dir.x *= -1
		animated_sprite.flip_h = false
	pass

func kill():
	var coin = coin_scene.instantiate()
	coin.global_position = global_position + Vector2(0, -6)
	get_tree().current_scene.add_child(coin)
	queue_free()
	pass
