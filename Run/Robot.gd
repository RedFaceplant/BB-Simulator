extends KinematicBody

var theArray = []
var justNames = []

var enabled = false

# How fast the player moves in meters per second.
export var speed = 50
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 0

var velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# This still needs momentum added to it
func _physics_process(delta):
	# We create a local variable to store the input direction.
	var forwardForce = 0
	var rotateForce = 0
	var leftMotor = 0
	var rightMotor = 0
	
	if enabled:
		# We check for each move input and update the direction accordingly.
		var checkRight = justNames.find("Right")
		if checkRight != -1:
			rightMotor = theArray[checkRight].power
		else:
			rightMotor = 0.0
		var checkLeft = justNames.find("Left")
		if checkLeft != -1:
			leftMotor = theArray[checkLeft].power
		else:
			leftMotor = 0.0
		
		forwardForce = (leftMotor + rightMotor)/2
		rotateForce = (leftMotor - rightMotor)/32
	
	# Ground velocity
	velocity.x = sin(self.rotation.y - PI/2) * forwardForce * speed
	velocity.z = cos(self.rotation.y - PI/2) * forwardForce * speed
	# Lateral movement
	velocity = move_and_slide(velocity, Vector3.UP)
	rotate_y(rotateForce)


func _on_RunMode_passing(obj2):
	if not obj2.motorName in justNames:
		justNames.push_back(obj2.motorName)
		theArray.push_back(obj2)
	
	for k in theArray:
		if k.motorName == obj2.motorName:
			k.power = obj2.power
