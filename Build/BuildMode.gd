extends Control

signal drivetrainUpdate(dt)

const drivetrains = ["6W Tank", "Mecanum", "Swerve"] #"Holonomic"

var selected = drivetrains[0]
const drivetrain_Descriptons = ["6W Tank desc", "Mecanum desc", "Swerve desc"]

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
		b.disabled = b.getDrivetrain  == selected
	$LeftSidebar/LabelSelected.text = str("Selected: ", selected)
	$Title.text = selected
	$Drivetrain.texture = load("res://Art/"+selected+".png")
	$LeftSidebar/Desc.text = drivetrain_Descriptons[drivetrains.find(selected)]


func _on_Button_button_down():
	get_parent().selectedDrivetrain = selected
	emit_signal("drivetrainUpdate", selected)
