extends Control

signal Generate()

func _on_Generate_pressed():
	emit_signal("Generate")
