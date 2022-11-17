extends GraphNode

signal Wire(x, p)

var port

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	self.

func _on_CheckButton_text_changed(new_text):
	emit_signal("Wire", float(new_text), port)
