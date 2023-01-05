extends GraphNode
const type = "Round"
export var data = {}
signal Wire(x, p)
const optionsArray = ["No Decimals", "Float 1", "Float 2", "Float 3", "Float 4", "Float 5"]
const stepAray = [1,.1,.01,.001,.0001,.00001]

var port
var A = 0
var functionsArray


func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		i += 1


func _wire(x, _p):
		A = x
		updateOutput()


func updateOutput():
	var output = stepify(A,stepAray[$OptionButton.selected])
	emit_signal("Wire", output, port)


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()

func _on_OptionButton_item_selected(_index):
	updateOutput()
