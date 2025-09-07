extends CharacterBody2D

@onready var game: Node2D = $".."
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var arrow_scene: PackedScene = preload("res://scenes/arrow.tscn")

const SPEED = 100.0
const JUMP_VELOCITY = -320.0

var is_alive := true
var bank: int = 6
var quiver: int = 5

func _physics_process(delta: float) -> void:
	var direction = 0
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and is_alive:
		velocity.y = JUMP_VELOCITY
	# Get the input direction
	if is_alive:
		direction = Input.get_axis("move_left", "move_right")
	flip_sprite(direction, animated_sprite)
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("move")
	else:
		animated_sprite.play("jump")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

var facing_right = true

func _ready() -> void:
	global_position = game.player_start_position
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_right"):
		facing_right = true
	if Input.is_action_just_pressed("move_left"):
		facing_right = false
	if Input.is_action_just_pressed("fire") and quiver > 0:
		spaw_arrow()
		quiver -= 1
		print("you have ", quiver, " arrows")

func die():
	if not is_alive:
		return
	is_alive = false
	
func spawn():
	global_position = game.player_start_position
	is_alive = true
	velocity = Vector2.ZERO
	animated_sprite.play("idle")
	pass
	
func flip_sprite(dir, sprite):
	if dir > 0:
		sprite.flip_h = false
	elif dir < 0:
		sprite.flip_h = true
	pass

func spaw_arrow():
	var arrow = arrow_scene.instantiate()
	arrow.global_position = global_position + Vector2(3, -8)
	if facing_right:
		arrow.direction = Vector2.RIGHT
	else:
		arrow.direction = Vector2.LEFT
	arrow.rotation = rotation
	get_tree().current_scene.add_child(arrow)
	pass
