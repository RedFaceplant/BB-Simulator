extends GraphNode


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _wire(x, _p):
	if x:
		$CheckButton.modulate = "00FF00"
	else:
		$CheckButton.modulate = "FF0000"
