extends Node2D

var turn : int = 0
var turnChoice : int = 0

onready var enemyPos1 = $EnemyPos1
onready var enemyPos2 = $EnemyPos2
onready var enemyPos3 = $EnemyPos3
onready var enemyPos4 = $EnemyPos4
onready var enemyPos5 = $EnemyPos5

var enemyPositions = []
var isEnemyTurn = false

onready var enemy = preload("res://Enemies/Enemy.tscn")

var generator = RandomNumberGenerator.new()

signal amountOfEnemies()

#func GenerateEnemies():
#	var amount = 1
#	amount = generator.randi_range(1,5)
#	for i in range(1,amount):
#		var e = enemy.instance()
#		enemyPositions[i].add_child(e)

#func Turn():
#	turnChoice = generator.randi_range(0,1)
#	match turnChoice:
#		0: isEnemyTurn = false
#		1: isEnemyTurn = true

#func _ready():
#	enemyPositions.append(enemyPos1)
#	enemyPositions.append(enemyPos2)
#	enemyPositions.append(enemyPos3)
#	enemyPositions.append(enemyPos4)
#	enemyPositions.append(enemyPos5)
#	generator.randomize()
#	GenerateEnemies()
