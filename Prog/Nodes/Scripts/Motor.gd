extends GraphNode

signal Motor(obj)

export var Motor = "Left"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = Motor
	self.connect("Motor", get_parent().get_parent(), "_motor")

func _wire(x, _p):
	emit_signal("Motor", {"motorName": Motor, "power": x})


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
