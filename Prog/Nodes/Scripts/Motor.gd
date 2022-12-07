extends GraphNode

signal Motor(obj)

export var Motor = "Left"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(Motor, " Motor")
	self.connect("Motor", get_parent().get_parent(), "_motor")

func _wire(x, _p):
	var motorPower = clamp(x, -1.0, 1.0)
	emit_signal("Motor", {"motorName": Motor, "power": motorPower})


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
