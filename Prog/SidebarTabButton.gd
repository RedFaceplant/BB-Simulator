extends Button
# This was not built for reuse outside the programming tab!

export var target = "Logic"

var sidebar = null

func _ready():
	var parent = self.get_parent()
	if parent.name != "Buttons":
		push_error("Sidebar Tabs were not built for reusue!")
		get_tree().paused = true
	else:
		sidebar = parent.get_parent()


func _on_SidebarTabButton_button_down():
	sidebar.select(target)
