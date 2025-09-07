extends Area2D

@onready var timer: Timer = $Timer
@onready var sprite: Sprite2D = $Sprite2D

var ARROW_SPEED := 180
var direction := Vector2.RIGHT

func _ready() -> void:
	sprite.flip_h = direction.x < 0
	timer.start()
	pass

func _process(delta: float) -> void:
	position += direction.normalized() * ARROW_SPEED * delta
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		if area.has_method("kill"):
			area.kill()
		queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
