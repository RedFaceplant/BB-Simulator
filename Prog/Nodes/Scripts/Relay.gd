extends GraphNode

signal Wire(x, p)

var Latch = false
var Wire = false
var Out = false
var port

# Called when the node enters the scene tree for the first time.
func _ready():
	updateOutput()


func updateOutput():
	if Latch:
		Out = Wire
	elif not Latch:
		Out = false
	emit_signal("Wire", Out, port)


func _wire(x, p):
	match p:
		0:
			Latch = x
		1:
			Wire = x
		_:
			return
	updateOutput()


#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
