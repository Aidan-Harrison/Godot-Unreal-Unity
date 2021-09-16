extends Node2D

# Name
export var itemName = ""
export var description = ""
var levelReq = 0
var typeReq = 0
export var iLevel = 0

var rar = 0

var globalPrefixes = ["", "Lucky", "Worn", "Flawed", "Prestine", "Infused"]
var globalSuffixes = ["", "of Agony", "of Prosperity", "of the Church", "of the Saints", "of Justice", "of Strength", "of Cunning", "of Mind", "of Light", "of the Abyss", "of Torment"] # Suffixes are global
var specialPrefixes = ["", "PRISMATIC", "SHATTERED", "CORRUPTED"] # Major changes to an item
var specialSuffixes = [""]

onready var sword = preload("res://Items/Sword.tscn")
onready var club = preload("res://Items/Club.tscn")
onready var dagger = preload("res://Items/Dagger.tscn")
onready var staff = preload("res://Items/Staff.tscn")
onready var boots = preload("res://Items/Boots.tscn")
onready var ring = preload("res://Items/Ring.tscn")
onready var amulet = preload("res://Items/Amulet.tscn")
onready var shield = preload("res://Items/Shield.tscn")
onready var helm = preload("res://Items/Helmet.tscn")
onready var chest = preload("res://Items/Chest.tscn")
onready var belt = preload("res://Items/Belt.tscn")

# Stats : Prefix | 2 max | Item Associated + Base Stat modifiers


# Stats : Suffix | 3 max | Global statistics | No relations


# UI
onready var itemUI = preload("res://ItemUI.tscn")

# Signals
signal nameSet(name)
signal implicitSet(val1, val2)
signal raritySet(rarityVal)
signal prefixSet(stats)
signal suffixSet(stats)
signal SetDesc(description)

var generator = RandomNumberGenerator.new()

func StatGenerator(item):
	var choice = 0
	# Rarity | Dictates amount of prefixes and suffixes generated 
	choice = generator.randi_range(0, 3)
	rar = choice
	if rar == 0:
		emit_signal("raritySet", 0)
	elif rar == 1:
		emit_signal("raritySet", 1)
	elif rar == 2:
		emit_signal("raritySet", 2)
	else: # Unqiue
		emit_signal("raritySet", 3)
	item.implicitValue1 = 10
	item.implicitValue2 = 15

func NameGenerator(item, itemType):
	var choice : int = 0
	if(itemType == "sword"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.sPrefixes.size()-1)
			item.itemName += item.sPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.sBases.size()-1)
		item.itemName += item.sBases[choice]
	elif(itemType == "club"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.clPrefixes.size()-1)
			item.itemName += item.clPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.clBases.size()-1)
		item.itemName += item.clBases[choice]
	elif(itemType == "dagger"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.dPrefixes.size()-1)
			item.itemName += item.dPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.dBases.size()-1)
		item.itemName += item.dBases[choice]
	elif(itemType == "staff"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.stPrefixes.size()-1)
			item.itemName += item.stPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.stBases.size()-1)
		item.itemName += item.stBases[choice]
	elif(itemType == "boots"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.boPrefixes.size()-1)
			item.itemName += item.boPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.boBases.size()-1)
		item.itemName += item.boBases[choice]
	elif(itemType == "ring"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.rPrefixes.size()-1)
			item.itemName += item.rPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.rBases.size()-1)
		item.itemName += item.rBases[choice]
	elif(itemType == "amulet"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.aPrefixes.size()-1)
			item.itemName += item.aPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.aBases.size()-1)
		item.itemName += item.aBases[choice]
	elif(itemType == "shield"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.shPrefixes.size()-1)
			item.itemName += item.shPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.shBases.size()-1)
		item.itemName += item.shBases[choice]
	elif(itemType == "helm"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.hPrefixes.size()-1)
			item.itemName += item.hPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.hBases.size()-1)
		item.itemName += item.hBases[choice]
	elif(itemType == "chest"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.chPrefixes.size()-1)
			item.itemName += item.chPrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.chBases.size()-1)
		item.itemName += item.chBases[choice]
	elif(itemType == "belt"):
		choice = generator.randi_range(0, 5)
		if(choice > 4):
			choice = generator.randi_range(0, item.bePrefixes.size()-1)
			item.itemName += item.bePrefixes[choice]
			item.itemName += " "
		choice = generator.randi_range(0, item.beBases.size()-1)
		item.itemName += item.beBases[choice]
		
	# Suffixes
	choice = generator.randi_range(0, 5)
	if(choice > 4):
		item.itemName += " "
		choice = generator.randi_range(0, globalSuffixes.size()-1)
		item.itemName += globalSuffixes[choice]

func Generate(): # Optimise!
	var choice : int = 1
	choice = generator.randi_range(1, 11)
	emit_signal("raritySet", rar)
	if(choice == 1):
		var s = sword.instance() 
		NameGenerator(s, "sword")
		StatGenerator(s)
		emit_signal("nameSet", s.itemName)
		emit_signal("implicitSet", s.implicitValue1, s.implicitValue2)
	elif(choice == 2):
		var c = club.instance()
		NameGenerator(c, "club")
		StatGenerator(c)
		emit_signal("nameSet", c.itemName)
		emit_signal("implicitSet", c.implicitValue1, c.implicitValue2)
	elif(choice == 3):
		var d = dagger.instance()
		NameGenerator(d, "dagger")
		StatGenerator(d)
		emit_signal("nameSet", d.itemName)
		emit_signal("implicitSet", d.implicitValue1, d.implicitValue2)
	elif(choice == 4):
		var st = staff.instance()
		NameGenerator(st, "staff")
		StatGenerator(st)
		emit_signal("nameSet", st.itemName)
		emit_signal("implicitSet", st.implicitValue1, st.implicitValue2)
	elif(choice == 5):
		var bo = boots.instance()
		NameGenerator(bo, "boots")
		StatGenerator(bo)
		emit_signal("nameSet", bo.itemName)
		emit_signal("implicitSet", bo.implicitValue1, bo.implicitValue2)
	elif(choice == 6):
		var r = ring.instance()
		NameGenerator(r, "ring")
		StatGenerator(r)
		emit_signal("nameSet", r.itemName)
		emit_signal("implicitSet", r.implicitValue1, r.implicitValue2)
	elif(choice == 7):
		var a = amulet.instance()
		NameGenerator(a, "amulet")
		StatGenerator(a)
		emit_signal("nameSet", a.itemName)
		emit_signal("implicitSet", a.implicitValue1, a.implicitValue2)
	elif(choice == 8):
		var sh = shield.instance()
		NameGenerator(sh, "shield")
		StatGenerator(sh)
		emit_signal("nameSet", sh.itemName)
		emit_signal("implicitSet", sh.implicitValue1, sh.implicitValue2)
	elif(choice == 9):
		var h = helm.instance()
		NameGenerator(h, "helm")
		StatGenerator(h)
		emit_signal("nameSet", h.itemName)
		emit_signal("implicitSet", h.implicitValue1, h.implicitValue2)
	elif(choice == 10):
		var ch = chest.instance()
		NameGenerator(ch, "chest")
		StatGenerator(ch)
		emit_signal("nameSet", ch.itemName)
		emit_signal("implicitSet", ch.implicitValue1, ch.implicitValue2)
	elif(choice == 11):
		var be = belt.instance()
		NameGenerator(be, "belt")
		StatGenerator(be)
		emit_signal("nameSet", be.itemName)
		emit_signal("implicitSet", be.implicitValue1, be.implicitValue2)

func _ready():
	generator.randomize()
	Generate()

# DEBUG ONLY
func _input(event):
	if event.is_action_pressed("ROLL"):
		Generate()
