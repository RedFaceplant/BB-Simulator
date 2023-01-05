extends GraphNode
const type = "Abs"
export var data = {}

signal Wire(x, p)

var A = 0
var port


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func updateOutput():
	var output = abs(A)
	emit_signal("Wire", output, port)


func _wire(x, _p):
	A = x
	updateOutput()


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()
