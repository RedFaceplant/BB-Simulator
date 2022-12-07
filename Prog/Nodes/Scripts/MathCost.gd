extends GraphNode

signal Wire(x, p)
const optionsArray = ["Pi", "e", "BB", "c"]
const functionsArray = [PI, exp(1), 3539, 299792458]

var port


func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		i += 1


func updateOutput():
	var output = functionsArray[$OptionButton.selected]
	emit_signal("Wire", output, port)


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p


func _on_OptionButton_item_selected(_index):
	updateOutput()
