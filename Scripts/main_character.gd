extends CharacterBody2D



@export var SPEED = 400.0
const JUMP_VELOCITY = -400.0
const INERTIA = 850
var double_jump = 2
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	$Sprite2D/KnifeHit/CollisionShape2D.disabled = true

func _process(delta: float) -> void:
	#print ("velocity.x: ", velocity.x)
	#print ("velocity.y: ", velocity.y)
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		SPEED = 250
		if double_jump == 0:
			double_jump += 1
		velocity += get_gravity() * delta
		velocity.x = move_toward(velocity.x, 0, INERTIA * delta)
	elif is_on_floor():
		double_jump = 0
		SPEED = 200

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and double_jump != 2:
		velocity.y = JUMP_VELOCITY
		double_jump += 1
	
	if Input.is_action_just_pressed("Attack"):
		animation_player.play("Attack")
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	var acceleration = SPEED * delta + 50
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED , acceleration)
		if direction == 1:
			sprite_2d.scale.x = 0.097
		elif direction == -1:
			sprite_2d.scale.x = -0.097
	else:
		velocity.x = move_toward(velocity.x, 0, INERTIA * delta)

	move_and_slide()


func _on_knife_hit_area_entered(area: Area2D) -> void:
	if area.is_in_group("knifeHit"):
		var overlapingArea = $Sprite2D/KnifeHit.get_overlapping_areas()
		print ("hit")
		for hitObject in overlapingArea:
			var parent = hitObject.get_parent()
			parent.queue_free()
