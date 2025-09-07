extends Area2D

@onready var timer: Timer = $Timer
@onready var sprite: Sprite2D = $Sprite2D

var speed := 180
var direction := Vector2.RIGHT
var auto_destroy := true

func _ready() -> void:
	sprite.flip_h = direction.x < 0
	timer.start()
	pass

func _process(delta: float) -> void:
	position += direction.normalized() * speed * delta
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		if area.has_method("kill"):
			area.kill()
		queue_free()
	pass # Replace with function body.



func _on_timer_timeout() -> void:
	if auto_destroy:
		queue_free()
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ground"):
		speed = 0
		await get_tree().create_timer(0.3).timeout
		queue_free()
	if body.name == "Player" and auto_destroy == false:
		print("hit player")
		queue_free()
		body.quiver += 1
	pass # Replace with function body.
