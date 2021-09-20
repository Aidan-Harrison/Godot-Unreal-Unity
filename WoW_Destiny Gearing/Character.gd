extends Spatial

export var stamina = 0
export var strength = 0
export var agility = 0
export var intellect = 0

export var criticalStrike = 0
export var haste = 0
export var mastery = 0
export var versatility = 0

export var avoidance = 0
export var indestructible = 0
export var leech = 0
export var speed = 0

export var health = 0
export var mana = 0
export var armor = 0

signal ChangeStats(values)

var stats = []

func _ready():
	stats.append(stamina)
	stats.append(strength)
	stats.append(agility)
	stats.append(intellect)
	stats.append(criticalStrike)
	stats.append(haste)
	stats.append(mastery)
	stats.append(versatility)
	stats.append(avoidance)
	stats.append(indestructible)
	stats.append(leech)
	stats.append(speed)
	ChangeStats(stats)

func ChangeStats(values):
	for i in values:
		stats[i] = i
	emit_signal("ChangeStats", values)
