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
	if player.has_method("spawn") and player.bank >= 5:
		player.bank -= 5
		print("You now have ", player.bank, " gold after respawn.")
		player.spawn()
	else:
		print("Not enough gold to respawn")
		get_tree().quit()
