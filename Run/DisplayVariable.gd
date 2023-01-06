extends Control


var myValue = 99


func _ready():
	self.visible = false


func setUp(Title, StartValue):
	$Name.text = str(Title)
	updateValue(StartValue)
	self.visible = true


func updateValue(newValue):
	if not str(newValue) == str(myValue):
		myValue = newValue
		$Value.text = str(myValue)


func _on_CloseButton_button_up():
	self.get_parent().get_parent().get_parent().deleteVar($Name.text)
