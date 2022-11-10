extends GraphNode

signal Wire(x, p)

var A = 0
var B = 0
var port

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func updateOutput():
	var output = A - B
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

#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	self.
