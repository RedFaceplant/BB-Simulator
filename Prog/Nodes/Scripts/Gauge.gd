extends GraphNode
const type = "Gauge"
export var data = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _wire(x, _p):
	$ProgressBar.value = x
