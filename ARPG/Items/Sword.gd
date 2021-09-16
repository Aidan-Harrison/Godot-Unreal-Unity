extends Node

export var itemName = ""
				# PREFIX, SPACE, BASE, SPACE, SUFFIX
export var itemNameTest = ["","","","",""]

var sPrefixes = ["", "Worn", "Flawed", "Prestine", "Forged", "Sharp", "Blunt", "Fine-Crafted", "Sturdy", "Dependable", "Holy", "Reinforced"]
var sBases = ["Straight Sword", "Scimitar", "Katana", "Rapier", "Falchion", "Twisted Sword", "Plate Sword", "Iron Sword"]

var implicitValue1 : int = 0
var implicitValue2 : int = 0

var implicitText1 = ""
var implicitText2 = ""

var impTier1 : int = 0
var impTier2 : int = 0

func GenerateImplicits(generator, name):
	var choice = 0
	if(name == "Straight Sword"):
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25) 
		implicitText1 = "damage"
		implicitText2 = "crit chance"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5
		
	elif(name == "Scimitar"):
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25)
		implicitText1 = "dexterity"
		implicitText2 = "crit chance"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5
		
	elif(name == "Katana"):
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25) # Check inclusive?
		implicitText1 = "damage"
		implicitText2 = "crit chance"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5
		
	elif(name == "Rapier"):
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25) # Check inclusive?
		implicitText1 = "pierce"
		implicitText2 = "crit multi"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5
		
	elif(name == "Falchion"):
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25) # Check inclusive?
		implicitText1 = "damage"
		implicitText2 = "crit chance"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5
		
	elif(name == "Twisted Sword"):
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25) # Check inclusive?
		implicitText1 = "damage"
		implicitText2 = "crit chance"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5
		
	elif(name == "Plate Sword"): # High damage and strength
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25) # Check inclusive?
		implicitText1 = "block"
		implicitText2 = "armor"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5	
	
	elif(name == "Iron Sword"):
		implicitValue1 = generator.randi_range(1, 25) # Check inclusive
		implicitValue2 = generator.randi_range(1, 25) # Check inclusive?
		implicitText1 = "damage"
		implicitText2 = "crit chance"
		# First Implicit
		if implicitValue1 >= 20: impTier1 = 1
		elif implicitValue1 < 20 && implicitValue1 > 15: impTier1 = 2
		elif implicitValue1 < 15 && implicitValue1 > 10: impTier1 = 3
		elif implicitValue1 < 10 && implicitValue1 > 5: impTier1 = 4
		else: impTier1 = 5
		# Second Implicit
		if implicitValue2 >= 20: impTier2 = 1
		elif implicitValue2 < 20 && implicitValue2 > 15: impTier2 = 2
		elif implicitValue2 < 15 && implicitValue2 > 10: impTier2 = 3
		elif implicitValue2 < 10 && implicitValue2 > 5: impTier2 = 4
		else: impTier2 = 5
