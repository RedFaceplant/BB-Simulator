extends GraphNode

signal Wire(x, p)

var A = "Two"
var B = "Strings"
var output
var port


func _ready():
	pass # Replace with function body.


func updateOutput():
	var output = str(A + B)
	print(output)
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
