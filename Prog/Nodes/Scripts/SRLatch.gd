extends GraphNode
const type = "SR Latch"
export var data = {}

signal Wire(x, p)

var Set = false
var Reset = false
var Out = false
var port


func _ready():
	updateOutput()


func updateOutput():
	if Set and Reset:
		Out = false
	elif Set and not Out:
		Out = true
	elif Reset and Out:
		Out = false
	emit_signal("Wire", Out, port)


func _wire(x, p):
	match p:
		0:
			Set = x
		1:
			Reset = x
		_:
			return
	updateOutput()


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()
