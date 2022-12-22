extends Control


func _ready():
	pass


func addPrintLine(text):
	var currText = $HBoxContainer/Terminal/RichTextLabel.text
	var newText = str("> ", text)
	$HBoxContainer/Terminal/RichTextLabel.bbcode_text = str(currText, "\n", newText)
