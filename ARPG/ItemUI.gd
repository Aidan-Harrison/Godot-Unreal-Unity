extends Control

onready var itemName = $ColorRect/ItemName
onready var iLevel =  $ColorRect/iLevelValue
onready var strReq = $ColorRect/StrReq
onready var dexReq = $ColorRect/DexReq
onready var intReq = $ColorRect/IntReq

# Implicit
onready var imp1 = $ColorRect/IStatContainer/Stat1
onready var imp2 = $ColorRect/IStatContainer/Stat2

func _on_Button_mouse_entered():
	visible = true

func _on_Button_mouse_exited():
	visible = false

func _on_Item_nameSet(name):
	itemName.text = name

func _on_Item_implicitSet(val1, val2):
	imp1.text = str(val1)
	imp2.text = str(val2)

func _on_Item_raritySet(rarityVal):
	match rarityVal:
		0:
			$ColorRect.color = Color.whitesmoke
		1:
			$ColorRect.color = Color.royalblue
		2:
			$ColorRect.color = Color.orange
		3:
			$ColorRect.color = Color.orangered
