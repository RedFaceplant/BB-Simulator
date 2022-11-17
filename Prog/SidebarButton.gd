extends Button

signal SpawnNode(type)

export var getButtonType = "Bulb"


func buttonSetup(type, GraphNodeReference):
	getButtonType = type
	self.text = type
	var _dumpVar = self.connect("SpawnNode", GraphNodeReference, "_spawnButton")


func _on_SidebarButton_button_down():
	emit_signal("SpawnNode", getButtonType)
