extends Node2D

export var health : int = 100
export var armor : int = 1

onready var item = preload("res://Item.tscn")

var generator = RandomNumberGenerator.new()
var choice : int = 0

func TakeDamage(damageToTake):
	health -= damageToTake - armor
	if(health <= 0):
		health = 0
		choice = generator.randi_range(0, 1)
		if(choice == 1):
			item.Generate()
			add_child(item)
