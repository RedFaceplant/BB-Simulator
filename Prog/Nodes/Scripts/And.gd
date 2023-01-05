extends GraphNode
const type = "AND"
export var data = {}
signal Wire(x, p)

var A
var B
var port


func _ready():
	pass


func updateOutput():
	var output = A and B
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
