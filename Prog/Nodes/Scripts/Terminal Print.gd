extends GraphNode
const type = "Terminal Print"
export var data = {}
signal Print(text)


func _ready():
	self.connect("Print", get_parent().get_parent(), "_print")


func _wire(x, _p):
	emit_signal("Print", x)
