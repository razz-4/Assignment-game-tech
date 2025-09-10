extends Node

var points = 0
@onready var label: Label = %Label

func add_points():
	points += 1
	label.text = "Coins: " + str(points)
