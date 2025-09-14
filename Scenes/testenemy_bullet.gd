extends Area2D

@onready var checkpoint : Vector2 = Vector2(200,232)
@onready var game_manager: Node = %gameManager
@onready var player : CharacterBody2D = null
@onready var timer: Timer = $Timer



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		game_manager.minus_hp()
		timer.start()


func _on_timer_timeout() -> void:
	if player and is_instance_valid(player):
		player.global_position = checkpoint
