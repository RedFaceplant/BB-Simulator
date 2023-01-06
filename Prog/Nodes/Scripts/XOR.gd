extends GraphNode
const type = "XOR"
export var data = {}

signal Wire(x, p)

var A
var B
var port


func _ready():
	pass # Replace with function body.


func updateOutput():
	var Or = A or B
	var Both = A and B
	var output = Or and not Both
	emit_signal("Wire", output, port)


func _wire(x, p):
	match p:
		0:
			A = x
		1:
			B = x
		_:
			return
	updateOutput()


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()

