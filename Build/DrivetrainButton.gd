extends Button

signal UpdateDrivetrain(type)

export var getDrivetrain = "Tank"


func buttonSetup(type, ParentNodeReference):
	getDrivetrain = type
	self.text = type
	var _dumpVar = self.connect("UpdateDrivetrain", ParentNodeReference, "_updateDrivetrain")


func _on_DrivetrainButton_button_down():
	emit_signal("UpdateDrivetrain", getDrivetrain)
