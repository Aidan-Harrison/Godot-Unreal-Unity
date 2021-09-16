extends Control

onready var col = $ColorRect
onready var nameTest = $ColorRect/Button/ITEMNAME

func _on_Item_nameSet(name):
	nameTest.text = name

func _on_Button_pressed(): # Item pickup
	pass # Replace with function body.

func _on_Item_raritySet(rarityVal): # Change to button, background!!!!????
	match rarityVal:
		0: col.color = Color.gray
		1: col.color = Color.royalblue
		2: col.color = Color.gold
		3: col.color = Color.orangered
