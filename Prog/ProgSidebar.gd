extends Control

var selected = "Logic"


func _ready():
	select("Logic")


func select(tab):
	for c in self.get_children():
		if c.name != "Buttons":
			c.visible = false
			if tab in c.name:
				c.visible = true
	
	for b in $Buttons.get_children():
		b.disabled = false
		if tab in b.name:
			b.disabled = true
