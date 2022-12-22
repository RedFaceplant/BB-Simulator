extends GraphNode

signal Wire(x, p)

var A = false
var port


func _ready():
	pass


func updateOutput():
	var output = !A
	emit_signal("Wire", output, port)


func _wire(x, _p):
	A = x
	updateOutput()


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()
