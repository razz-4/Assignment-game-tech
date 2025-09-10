extends CharacterBody2D



const SPEED = 400.0
const JUMP_VELOCITY = -400.0
const INERTIA = 850
var double_jump = 2
func _process(delta: float) -> void:
	#print ("velocity.x: ", velocity.x)
	#print ("velocity.y: ", velocity.y)
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if double_jump == 0:
			double_jump += 1
		velocity += get_gravity() * delta
		velocity.x = move_toward(velocity.x, 0, INERTIA * delta)
	elif is_on_floor():
		double_jump = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and double_jump != 2:
		velocity.y = JUMP_VELOCITY
		double_jump += 1
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var acceleration = SPEED * delta + 10
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED , acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, INERTIA * delta)

	move_and_slide()
