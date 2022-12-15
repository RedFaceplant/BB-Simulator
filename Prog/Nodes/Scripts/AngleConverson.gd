extends GraphNode

signal Wire(x, p)

var port
var output
var A = 0
const optionsArray = ["Deg to Rad", "Rad to Deg"]


func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		i += 1

func _wire(x, p):
	A = x
	updateOutput()
	
func updateOutput():
	var stepAray = [deg2rad(A), rad2deg(A)]
	output = stepAray[$OptionButton.selected]
	emit_signal("Wire", output, port)
#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p

func _on_OptionButton_item_selected(index):
	updateOutput()
