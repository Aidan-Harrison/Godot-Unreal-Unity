extends Control

var app = "Accelerator"
var currentFile = "Untitled"

# Menu Bar
onready var fileMenu = $MenuBar/File
onready var helpMenu = $MenuBar/Help
# General
onready var menuBar = $MenuBar
onready var aboutPage = $AboutPanel
var following = false
var draggingStartPos = Vector2.ZERO
# Other
onready var notePad = preload("res://Notepad.tscn")

func _ready():
	OS.set_window_title(app + ' - ' + currentFile)
	# File Menu =====================================================
	fileMenu.get_popup().connect("id_pressed", self, "onItemMenuPressed")
	# Help Menu =====================================================
	helpMenu.get_popup().connect("id_pressed", self, "onHelpMenuPressed")
	
func onItemMenuPressed(id):
	var itemName = fileMenu.get_popup().get_item_text(id)
	if itemName == "Open File":
		print("Open!")
	elif itemName == "Save File":
		print("Save!")
	elif itemName == "Exit":
		get_tree().quit()
		
func onHelpMenuPressed(id):
	var itemName = helpMenu.get_popup().get_item_text(id)
	if itemName == "About":
		$AboutPanel.popup()
	elif itemName == "Help":
		$HelpPanel.popup()

func _on_HideMenu_button_down(): # Fix
	menuBar.visible = false

func _on_NOTEPAD_button_down():
	$NotePad.popup()

# Menu Bar
func _on_MenuBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			draggingStartPos = get_local_mouse_position()
func _on_Minimize_pressed(): OS.set_window_minimized(true)
func _on_Button_pressed(): get_tree().quit()

func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - draggingStartPos)

