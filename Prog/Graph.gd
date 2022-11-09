extends GraphEdit

var selected_nodes = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Handles connections
func _on_Graph_connection_request(from, from_slot, to, to_slot):
	# Dont connect if there's already something in the input
	for c in self.get_connection_list():
		if c.to == to and c.to_port == to_slot:
			return
			
	self.connect_node(from, from_slot, to, to_slot)
	var nodeA = self.get_node(from)
	var nodeB = self.get_node(to)
	nodeA.connect("Wire", nodeB, "_wire")
	nodeA.flashPort(to_slot)


# Handles disconnects
func _on_Graph_disconnection_request(from, from_slot, to, to_slot):
	self.disconnect_node(from, from_slot, to, to_slot)
	var nodeA = self.get_node(from)
	var nodeB = self.get_node(to)
	nodeA.disconnect("Wire", nodeB, "_wire")
	nodeA.flashPort(null)


# Handles group selection and deseletion
func _on_Graph_node_selected(node):
	selected_nodes[node] = true

func _on_Graph_node_unselected(node):
	selected_nodes[node] = false


func _on_Graph_delete_nodes_request():
	for node in selected_nodes.keys():
		if selected_nodes[node]:
			remove_node_connections(node)
			node.queue_free()
	selected_nodes = {}

func remove_node_connections(node):
	for c in self.get_connection_list():
		if c.to == node.name or c.from == node.name:
			self.disconnect_node(c.from, c.from_port, c.to, c.to_port)
