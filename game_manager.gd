extends Node

var points = 0
@onready var label: Label = %Label
@onready var health_1: TextureProgressBar = $"CanvasLayer/Health bar/TextureProgressBar"
@onready var health_2: TextureProgressBar = $"CanvasLayer/Health bar/TextureProgressBar2"
@onready var health_3: TextureProgressBar = $"CanvasLayer/Health bar/TextureProgressBar3"
@onready var game_over_timer: Timer = $"CanvasLayer/Health bar/GameOverTimer"
@onready var checkpoint: Vector2 = Vector2(200,232)
var game_over: bool = false
var health = 3

func add_points():
	points += 1
	label.text = "Coins: " + str(points)

func minus_hp():
	health -= 1
	if health == 2:
		health_3.value = 0
	elif health == 1:
		health_2.value = 0
	elif health == 0:
		health_1.value = 0
		game_over = true
		print("Game Over")


func _on_win_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$"CanvasLayer/Level finish menu".visible = true
		print("You Win")


func _on_game_over_timer_timeout() -> void:
	get_tree().reload_current_scene()
