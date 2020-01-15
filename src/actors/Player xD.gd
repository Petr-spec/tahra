extends KinematicBody2D




export var speed = Vector2(300, 500)
var grav = 1000
var velocity = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	velocity = calculate_velocity(velocity, direction, speed)
	velocity = move_and_slide(velocity, Vector2.UP)
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		-1.0 if Input.is_action_pressed("up") and is_on_floor() else 1.0
		)
	if Input.is_action_just_pressed("up"):
		$skok.play(1)

func calculate_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += grav * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	return new_velocity