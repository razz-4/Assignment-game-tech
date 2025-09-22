extends Area2D

@onready var game_manager: Node = %gameManager
@onready var respawn: Area2D = $"."
var respawnSet = false



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if !respawnSet: #To make sure it activate once
			game_manager.checkpoint = respawn.global_position
			print("respawn point set")
			respawnSet = true
