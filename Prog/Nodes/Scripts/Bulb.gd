extends GraphNode
const type = "Bulb"

export var data = {}


func _wire(x, _p):
	if x:
		$CheckButton.modulate = "00FF00"
	else:
		$CheckButton.modulate = "FF0000"
