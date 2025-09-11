extends Area2D

@export var SPEED = 250

var dir : float 
var spawnPos : Vector2
var spawnRot : float 
@onready var checkpoint : Vector2 = Vector2(200,232) #position of the respawn point
@onready var timer: Timer = $Timer
@onready var player : CharacterBody2D = null






#Get global position/rotaion of the enemy in spawnPos/spawnRot
func _ready():
	global_position = spawnPos
	global_rotation = spawnRot

	
func _process(delta): 
	position += Vector2 (0,-1).rotated(dir) * SPEED * delta #rotated(dir)=shoot where the enemy is facing
	print("Bullet dir:", rad_to_deg(dir))
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("body entered")
		player = body
		timer.start()
	
	
	

func _on_timer_timeout() -> void:
	if player and is_instance_valid(player):
		player.global_position = checkpoint
		

	
