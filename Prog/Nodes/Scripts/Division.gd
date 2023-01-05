extends GraphNode
const type = "Division"
export var data = {}

signal Wire(x, p)

var A = 0
var B = 1
var port


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func updateOutput():
	var output = 0
	if B == 0:
		output = NAN
	else:
		output = A / B
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
