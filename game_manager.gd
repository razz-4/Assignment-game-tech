extends Node

var points = 0
@onready var label: Label = %Label
@onready var health_1: TextureProgressBar = $CanvasLayer/TextureProgressBar
@onready var health_2: TextureProgressBar = $CanvasLayer/TextureProgressBar2
@onready var health_3: TextureProgressBar = $CanvasLayer/TextureProgressBar3
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
