extends Control

onready var staminaStat = $ColorRect/StatValues/StaminaVal
onready var strengthStat = $ColorRect/StatValues/StrengthVal
onready var agilityStat = $ColorRect/StatValues/AgilityVal
onready var intellectStat = $ColorRect/StatValues/IntellectVal
onready var critStrikeStat = $ColorRect/StatValues/CriticalStrikeVal
onready var hasteStat = $ColorRect/StatValues/HasteVal
onready var masteryStat = $ColorRect/StatValues/MasteryVal
onready var versatilityStat = $ColorRect/StatValues/VersatilityVal
onready var avoidanceStat = $ColorRect/StatValues/AvoidanceVal
onready var indestructibleStat = $ColorRect/StatValues/IndestructibleVal
onready var leechStat = $ColorRect/StatValues/LeechVal
onready var speedStat = $ColorRect/StatValues/SpeedVal

var statValues = []

signal changeStats(values)

func _ready():
	statValues.append(staminaStat)
	statValues.append(strengthStat)
	statValues.append(agilityStat)
	statValues.append(intellectStat)
	statValues.append(critStrikeStat)
	statValues.append(hasteStat)
	statValues.append(masteryStat)
	statValues.append(versatilityStat)
	statValues.append(avoidanceStat)
	statValues.append(indestructibleStat)
	statValues.append(leechStat)
	statValues.append(speedStat)

func ChangeStats(values): # Two way signal
	emit_signal("changeStats", values)

func _on_Character_ChangeStats(values):
	for i in range(statValues.size()):
		statValues[i].text = str(values[i])

func _on_Button_pressed():
	print("HIT")
	#ChangeStats()
