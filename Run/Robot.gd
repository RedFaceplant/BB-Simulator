extends KinematicBody

var theArray = []
var justNames = []

var enabled = false
var currDT = "6W Tank"

# How fast the player moves in meters per second.
export var speed = 50
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 0

var velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# This still needs momentum added to it
func _physics_process(_delta):
	# We create a local variable to store the input direction.
	var motors = [{"Name": "FrontLeft", "Power": 0},
				{"Name": "FrontRight", "Power": 0}]
	
	var forwardForce = 0.0
	var rotateForce = 0.0
#	var strafeForce = 0.0 # Here for future use
	
	if enabled:
		for m in motors:
			var location = justNames.find(m.Name)
			if location != -1:
				m.Power = theArray[location].power
			else:
				m.Power = 0.0
		
		match currDT:
			"6W Tank":
				forwardForce = (motors[0].Power + motors[1].Power)/2
				rotateForce = (motors[0].Power - motors[1].Power)/32
#				strafeForce = 0.0 # Here for future use
	
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
