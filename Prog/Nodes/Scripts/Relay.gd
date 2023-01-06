extends GraphNode
const type = "Relay"
export var data = {}

signal Wire(x, p)

var Coil = false
var Through = false
var Out = false
var port


func _ready():
	pass


func updateOutput():
	if Coil:
		Out = Through
	else:
		Out = null
	emit_signal("Wire", Out, port)


func _wire(x, p):
	match p:
		0:
			Coil = x
		1:
			Through = x
		_:
			return
	updateOutput()


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()
