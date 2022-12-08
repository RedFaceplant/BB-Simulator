extends Spatial

signal passing(obj2)


func _ready():
	pass # Replace with function body.


func _incoming_motors(obj):
	emit_signal("passing", obj)


func _on_Enabled_toggled(button_state):
	$Robot.enabled = button_state
