extends GraphNode

signal Wire(x, p)
var optionsArray = ["Sin", "Cos", "Tan","Arcsin","Arccos","arctan"]


var port
var A = 0
var functionsArray

# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		i += 1
func _wire(x, p):
		A = x
		updateOutput()
	
func updateOutput():
	functionsArray = [sin(A),cos(A),tan(A),asin(A),acos(A),atan(A)]
	print($OptionButton.selected)
	var output = functionsArray[$OptionButton.selected]
	emit_signal("Wire", output, port)

# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	match funniArray[$OptionButton.selected]: #Get the selected option
#		"LeftStickY":
#			joystickValue = Input.get_axis("0-LeftStickU", "0-LeftStickD")
#		"LeftStickX":
#			joystickValue = Input.get_axis("0-LeftStickL", "0-LeftStickR")
#		"RightStickY":
#			joystickValue = Input.get_axis("0-RightStickU", "0-RightStickD")
#		"RightStickX":
#			joystickValue = Input.get_axis("0-RightStickL", "0-RightStickR")
#		_:
#			joystickValue = null
#
#	joystickValue = stepify(joystickValue, 0.1) #Rounds to 1 decimal place
#
#	if preValue != joystickValue:
#		preValue = joystickValue
#		updateSignal(joystickValue)
