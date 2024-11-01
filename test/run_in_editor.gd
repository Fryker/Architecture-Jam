@tool
extends EditorScript


func _run() -> void:
	for child in get_all_children(get_scene()):
		child. assign_data()
		print('lol')


func get_all_children(in_node, children_acc = []):
	children_acc.push_back(in_node)
	for child in in_node.get_children():
		children_acc = get_all_children(child, children_acc)

	return children_acc
