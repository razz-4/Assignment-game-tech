extends Node2D

@export var SPEED = 250

var dir : float 
var spawnPos : Vector2
var spawnRot : float 


#Get global position/rotaion of the enemy in spawnPos/spawnRot
func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	
func _process(delta): 
	position += Vector2 (0,-1).rotated(dir) * SPEED * delta #rotated(dir)=shoot where the enemy is facing
	print("Bullet dir:", rad_to_deg(dir))
	
	
