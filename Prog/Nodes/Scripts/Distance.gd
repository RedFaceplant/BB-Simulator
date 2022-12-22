extends GraphNode

signal Wire(x, p)
const optionsArray = ["meter", "miles", "km", "mm", "cm", "feet", "inches"]

var port
var A = 0
var meter
var convert_table


func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		$OptionButton2.add_item(a, i)
		i += 1


func convert_dist(length, unit_in, unit_out):
	meter = {"mm": 1000,
			"cm": 100,
			"meter": 1,
			"km": 0.001,
			"inches": 39.3701,
			"miles": 0.000621371,
			"feet": 3.28084}

	if unit_out == "":
		convert_table = meter
		for x in meter:
			convert_table[x] = (length / meter[unit_in]) * convert_table[x]
		return meter
	else:
		return (length / meter[unit_in]) * meter[unit_out]


func _wire(x, p):
			A = x


func updateOutput():
	var output = convert_dist(A, optionsArray[$OptionButton.selected], optionsArray[$OptionButton2.selected])
	emit_signal("Wire", output, port)


func flashPort(p):
	port = p
	updateOutput()


func _on_OptionButton_item_selected(_index):
	updateOutput()