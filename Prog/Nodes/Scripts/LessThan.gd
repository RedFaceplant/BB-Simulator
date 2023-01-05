extends GraphNode
const type = "Less Than"
export var data = {}
signal Wire(x, p)

var A = 0.0
var B = 0.0
var port


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func updateOutput():

	#emit_signal("Wire", abs(A-B) < 0.0000001, port)
	emit_signal("Wire", A < B, port)
func _wire(x, p):
	match p:
		0:
			A = x
		1:
			B = x
		_:
			return
	updateOutput()

#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()
