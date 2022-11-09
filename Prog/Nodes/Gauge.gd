extends GraphNode

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _wire(x, _p):
	$ProgressBar.value = x


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
