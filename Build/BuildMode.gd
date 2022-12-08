extends Control

const drivetrains = ["6W Tank", "Holonomic", "Mechanum", "Swerve"]

var selected = drivetrains[0]

onready var dtButton = load("res://Build/DrivetrainButton.tscn")


func _ready():
	for dt in drivetrains:
		var newButton = dtButton.instance()
		$LeftSidebar/DrivetrainSelection/Vbox.add_child(newButton)
		newButton.buttonSetup(dt, self)
	_updateDrivetrain(selected)


func _updateDrivetrain(type):
	selected = type
	for b in $LeftSidebar/DrivetrainSelection/Vbox.get_children():
		b.disabled = b.getDrivetrain == selected
	$LeftSidebar/LabelSelected.text = str("Selected: ", selected)
	$Title.text = selected
	#Update Texture
	#Update Description
