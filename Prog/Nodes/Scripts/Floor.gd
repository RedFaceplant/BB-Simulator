extends GraphNode
const type = "Floor"
export var data = {}

signal Wire(x, p)

var A = 0
var port


func _ready():
	pass # Replace with function body.


func updateOutput():
	var output = floor(A)
	emit_signal("Wire", output, port)


func _wire(x, _p):
	A = x
	updateOutput()


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()
