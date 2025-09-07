extends Area2D

@onready var timer: Timer = $Timer
var player: Node2D = null

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		Engine.time_scale = 0.4
		timer.start()
		if player.has_method("die"):
			player.die()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	if player.has_method("spawn"):
		player.spawn()
