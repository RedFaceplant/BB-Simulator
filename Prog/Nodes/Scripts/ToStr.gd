extends GraphNode
const type = "ToString"
export var data = {}
signal Wire(x, p)

var port
var output
var A = 0


func _ready():
	pass # Replace with function body.


func _wire(x, p):
	A = x
	updateOutput()


func updateOutput():
	var output = str(A)
	emit_signal("Wire", output, port)


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()
