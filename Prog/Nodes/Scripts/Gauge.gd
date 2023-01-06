extends GraphNode
const type = "Gauge"
export var data = {}


func _ready():
	pass # Replace with function body.


func _wire(x, _p):
	$ProgressBar.value = x
