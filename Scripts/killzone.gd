extends Area2D


@onready var timer: Timer = $Timer
@onready var player : CharacterBody2D = null
@onready var game_manager: Node = %gameManager

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("body entered")
		player = body
		timer.start()
		game_manager.minus_hp()
	

func _on_timer_timeout() -> void:
	if player and is_instance_valid(player):
		print (game_manager.game_over)
		if !game_manager.game_over:
			player.global_position = game_manager.checkpoint
		else:
			game_manager.game_over_timer.start()
