extends GraphEdit

class NodeData:
	extends Resource

	export var name: String
	export var type: String
	export var offset: Vector2
	export var data = {}


class GraphData:
	extends Resource
	
	export var connections: Array
	export var nodes: Array


var selected_nodes = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Creates a new node
func makeNewNode(nodeType, position):
	var path = load("res://Prog/Nodes/"+nodeType+".tscn")
	if path == null:
		push_error("Node '"+ nodeType+ "' not found!")
		get_tree().paused = true
	else:
		var newNode = load("res://Prog/Nodes/"+nodeType+".tscn").instance()
		self.add_child(newNode)
		newNode.offset = position


func _spawnButton(type): # Comes from the sidebar buttons
	makeNewNode(type, Vector2(100,100))


# Handles connections
func _on_Graph_connection_request(from, from_slot, to, to_slot):
	# Dont connect if there's already something in the input
	for c in self.get_connection_list():
		if c.to == to and c.to_port == to_slot:
			return
			
	var _dumpVar = self.connect_node(from, from_slot, to, to_slot)
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


func save_data(file_name):
	var graph_data = GraphData.new()
	graph_data.connections = self.get_connection_list()
	for node in self.get_children():
		if node is GraphNode:
			var node_data = NodeData.new()
			node_data.name = node.name
			node_data.type = node.type
			node_data.offset = node.offset
#			node_data.data = node.data
			graph_data.nodes.append(node_data)
	if ResourceSaver.save(file_name, graph_data) == OK:
		print("saved")
		init_graph(graph_data)
	else:
		print("Error saving graph_data")


func load_data(file_name):
	if ResourceLoader.exists(file_name):
		var graph_data = ResourceLoader.load(file_name)
		if graph_data is GraphData:
			init_graph(graph_data)
			print("loaded")
		else:
			print("File is invalid")
	else:
		print("File doesnt exist")


func init_graph(graph_data: GraphData):
	clear_graph()
	for node in graph_data.nodes:
		# Get new node from factory autoload (singleton)
		makeNewNode(node.type, node.offset)
	for con in graph_data.connections:
		_on_Graph_connection_request(con.from, con.from_port, con.to, con.to_port)


func clear_graph():
	self.clear_connections()
	var nodes = self.get_children()
	for node in nodes:
		if node is GraphNode:
			node.queue_free()



func _on_DeleteButton_down():
	_on_Graph_delete_nodes_request()


func _on_SaveButton_button_down():
	save_data("Test.res")


func _on_LoadButton_button_down():
	load_data("Test.res")
