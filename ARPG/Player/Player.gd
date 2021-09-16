extends Node2D

# Base
export var health : int = 100
export var mana : int = 100
export var shield : int = 0 # Borderlands esque shield
export var damage : int = 10
export var armor : int = 1
export var level : int = 0

enum type{STRENGTH, AGILITY, INTELLIGENCE}

# Resistance
export var fireRes : int = 0 # Percent based
export var coldRes : int = 0
export var lightRes : int = 0

# Inventory
var items = []
var invenVisible = false
var charVisible = false

# Enemies
onready var enemy = preload("res://Enemies/Enemy.tscn")
var enemies = []

onready var inventoryUI = $Inventory #Change to parent!?
onready var statUI = $StatScreen #Change to parent!?

signal updateCharUI()

func _ready():
	inventoryUI.visible = true

#func _input(event):
#	if event.is_action_pressed("Inventory"):
#		if !invenVisible: 
#			invenVisible = true
#		else: 
#			inventoryUI.visible = false
#			invenVisible = false
#	if event.is_action_pressed("Character"):
#		if !charVisible: 
#			statUI.visible = true
#			charVisible = true
#		else: 
#			statUI.visible = false
#			charVisible = false

#func TakeDamage(damageToTake):
#	health -= damageToTake
#	if health <= 0:
#		health = 0
