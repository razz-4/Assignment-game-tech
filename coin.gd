extends Area2D

@onready var coin: Area2D = $"."
var points = 0
@onready var game_manager: Node = %gameManager

func _on_body_entered(body: Node2D) -> void:
	if body.name == "mainCharacter":
		queue_free()
		game_manager.add_points()
