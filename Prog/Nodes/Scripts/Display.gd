extends GraphNode
const type = "Display"
export var data = {}


func _ready():
	pass # Replace with function body.


func _wire(x, _p):
	$VisualDisplay.text = str(x)
