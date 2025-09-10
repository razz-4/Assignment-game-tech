extends Node2D

@onready var main = get_tree().get_root().get_node("mainWorld")
@onready var projectile = load("res://Scenes/testenemy_bullet.tscn")
@onready var enemy : Node2D = $"."
@onready var timer: Timer = $Timer
var target : CharacterBody2D = null

func _process(delta: float) -> void:
	if target:
		enemy.look_at(target.global_position)
		enemy.rotation += deg_to_rad(90)  # rotate 90° more

func shoot():
	var instance = projectile.instantiate()
	instance.dir = enemy.global_rotation
	instance.spawnPos = global_position
	instance.spawnRot = enemy.global_rotation
	main.add_child.call_deferred(instance)


func _on_timer_timeout() -> void:
	shoot()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body:
		target = body
		timer.start()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body:
		target = null
		timer.stop()
