extends Control

signal drivetrainUpdate(dt)

const drivetrains = ["6W Tank", "Mecanum", "Swerve"] #"Holonomic"
const isAvailable = [true, false, false, false]

var selected = drivetrains[0]
const drivetrain_Descriptons = [
		"A basic, reliable, and powerful drivetrain. Uses 6 wheels for a good balance of speed and power to move. It's only main downside is being unable to strafe.", # Tank
		"A chassis with a simple change to the 4W tank - it utilises the unique Mecanum wheels to strafe, though the all-roller wheels leaves traction to be desired.", # Mecanum
		"An upgrade to a Crab drivetrain that gives each wheel two motors to control power and direction independently. Incredibly powerful if you know how to use it right.", # Swerve
		]

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
	var index = drivetrains.find(selected)
	$LeftSidebar/Desc.text = drivetrain_Descriptons[index]
	$RightSidebar/Button.disabled = not isAvailable[index]
	$RightSidebar/Unavailable.visible = not isAvailable[index]


func _on_Button_button_down():
	get_parent().selectedDrivetrain = selected
	emit_signal("drivetrainUpdate", selected)
