extends Control

# Open Dialogs
func _on_SaveFile_pressed(): $SaveFileDialog.popup()
func _on_OpenFile_pressed(): $OpenFileDialog.popup()

func _on_OpenFileDialog_file_selected(path):
	var f = File.new()
	f.open(path, 1) # 1 = Read
	$TextEdit.text = f.get_as_text()
	f.close() # Frees from memory

func _on_SaveFileDialog_file_selected(path):
	var f = File.new()
	f.open(path, 2) # 2 = Write
	f.store_string($TextEdit.text)
	f.close() # Frees from memory
