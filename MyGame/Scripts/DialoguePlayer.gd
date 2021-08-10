extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file

var dialogues = []
var current_dialogue_id = 0
var is_dialogue_active = false

signal BoxActive
signal BoxFinished

func _ready():
	$NinePatchRect.visible = false

func play():
	if is_dialogue_active:
		return

	dialogues = load_dialogue()

#	turn_off_the_player()
	is_dialogue_active = true
	$NinePatchRect.visible = true
	emit_signal("BoxActive")
	current_dialogue_id = -1
	next_line()

func _input(event):
	if not is_dialogue_active:
		return

	if event.is_action_pressed("dialogue_interact"):
		next_line()

func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogues):
		$NinePatchRect.visible = false
		emit_signal("BoxFinished")
#		turn_on_the_player()
		return

	$NinePatchRect/Name.text = dialogues[current_dialogue_id]["name"]
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]["text"]

func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())

#func turn_on_the_player():
#	var player = get_tree().get_root().find_node("Player", true, false)
#	if player:
#		player.set_active(true)

#func turn_off_the_player():
#	var player = get_tree().get_root().find_node("Player", true, false)
#	if player:
#		player.set_active(false)
