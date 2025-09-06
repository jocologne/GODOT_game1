extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -320.0

var is_alive := true

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

func die():
	if not is_alive:
		return
	is_alive = false
	
func flip_sprite(dir, sprite):
	if dir > 0:
		sprite.flip_h = false
	elif dir < 0:
		sprite.flip_h = true
	pass
