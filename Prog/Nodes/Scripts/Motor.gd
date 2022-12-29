extends GraphNode

signal Motor(obj)

export var Motor = "Left"


func _ready():
	$Label.text = str(Motor, " Motor")
	var _dummyVal = self.connect("Motor", get_parent().get_parent(), "_motor")


func _wire(x, _p):
	var motorPower = clamp(x, -1.0, 1.0)
	emit_signal("Motor", {"motorName": Motor, "power": motorPower})
