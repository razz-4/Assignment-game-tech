extends Node2D

@onready var main = get_tree().get_root().get_node("mainWorld")
@onready var enemy: Node2D = $"."
@onready var timer: Timer = $Timer
var target: CharacterBody2D = null
var current_index = 0
var active_bullets = []
@onready var bullets: Array =$"../Bullet".get_children()  # bullet pool


func _process(delta: float) -> void:
	if target:
		enemy.look_at(target.global_position)
		enemy.rotation += deg_to_rad(90)  # rotate 90° more

	# Move all active bullets
	for bullet in active_bullets:
		var velocity = Vector2(0, -1).rotated(bullet.rotation) * 500  # 10 px/sec
		bullet.global_position += velocity * delta


func _on_timer_timeout() -> void:
	if current_index < bullets.size():
		var bullet = bullets[current_index]
		bullet.global_position = enemy.global_position
		bullet.rotation = enemy.global_rotation
		active_bullets.append(bullet)
		current_index += 1
	else:
		# reset pool
		current_index = 0
		active_bullets.clear()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body:
		target = body
		timer.start()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body:
		timer.stop()
