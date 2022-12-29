extends Control

signal drivetrainUpdate(dt)

const drivetrains = ["6W Tank", "Mecanum", "Swerve"] #"Holonomic"

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
	$Drivetrain.texture = load("res://Art/"+selected+".png")
	# Update Description


func _on_Button_button_down():
	get_parent().selectedDrivetrain = selected
	emit_signal("drivetrainUpdate", selected)
