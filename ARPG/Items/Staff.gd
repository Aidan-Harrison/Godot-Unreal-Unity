extends Node

export var itemName = ""

var stPrefixes = ["", "Magic", "Infused", "Worn", "Engraved"]
var stBases = ["Wooden Staff", "Branch", "Iron Staff"]

var implicitValue1 : int = 0
var implicitValue2 : int = 0

signal SetName(name) # Sets the UI
