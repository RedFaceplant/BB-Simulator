extends GraphNode
const type = "Motor"
export var data = {"motor": "Square"}

signal Motor(obj)

func _ready():
	data.motor = data.motor
	$Label.text = str(data.motor, " Motor")
	var _dummyVal = self.connect("Motor", get_parent().get_parent(), "_motor")


func _wire(x, _p):
	var motorPower = clamp(x, -1.0, 1.0)
	emit_signal("Motor", {"motorName": data.motor, "power": motorPower})


func setMotor(newMotor):
	data.motor = newMotor
