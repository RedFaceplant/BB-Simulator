extends GraphNode

signal Wire(x, p)

var A = false
var port

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func updateOutput():
	var output = !A
	emit_signal("Wire", output, port)

func _wire(x, _p):
	A = x
	updateOutput()

#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	self.
