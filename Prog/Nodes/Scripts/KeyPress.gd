extends GraphNode
const type = "Key Press"
export var data = {}

signal Wire(x, p)
const optionsArray = ["A", "B", "C", "D","E", "F", "G", "H","I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U", "V","W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
const keysArray = [KEY_A, KEY_B, KEY_C, KEY_D, KEY_E, KEY_F, KEY_G, KEY_H, KEY_I, KEY_J, KEY_K, KEY_L, KEY_M, KEY_N, KEY_O, KEY_P, KEY_Q, KEY_R, KEY_S, KEY_T, KEY_U, KEY_V, KEY_W, KEY_X, KEY_Y, KEY_Z, KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9]

var port


func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		i += 1


func updateOutput(value):
		emit_signal("Wire", value, port)


func _process(_delta):
	updateOutput( Input.is_key_pressed(keysArray[$OptionButton.selected]) )


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput(false)


func _on_OptionButton_item_selected(_index):
	pass
