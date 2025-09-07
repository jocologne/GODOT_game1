extends Area2D

@onready var game: Node2D = $"../.."

var is_player_near = false
var player: Node2D = null

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if is_player_near and Input.is_action_just_pressed("interact"):
		if player.bank >= 5:
			player.bank -= 5
			save_game()
			print("Game saved, you now have ", player.bank, " gold!")
		else:
			print("not enough gold to save!")
	pass

func _on_body_entered(body: Node2D) -> void:
	print("teste")
	if body.name == "Player":
		is_player_near = true
		player = body
		print("Save point for 5 gold?")
		

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		is_player_near = false
		player = null

func save_game():
	game.player_start_position = global_position
	print("Saved at position ", game.player_start_position)
	pass
