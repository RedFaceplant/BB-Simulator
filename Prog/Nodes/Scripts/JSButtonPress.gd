extends GraphNode

signal Wire(x, p)
const optionsArray = ["A", "B", "X", "Y","DP up", "DP Down", "DP Left", "DP Right","LT", "LB", "RT", "RB"]
const buttonArray = [JOY_BUTTON_0, JOY_BUTTON_1, JOY_BUTTON_2, JOY_BUTTON_3, JOY_DPAD_UP, JOY_DPAD_DOWN, JOY_DPAD_LEFT, JOY_DPAD_RIGHT, JOY_L2, JOY_L, JOY_R2, JOY_R]


var port


func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		i += 1


func updateOutput(value):
		emit_signal("Wire", value, port)


func _process(delta):
	if Input.is_joy_button_pressed(0,buttonArray[$OptionButton.selected]):
		updateOutput(true)
	else:
		updateOutput(false)


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput(false)


func _on_OptionButton_item_selected(_index):
	pass
