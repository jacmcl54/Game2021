extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file

var dialogues = []

func _ready():
	play()
	
func play():
	dialogues = load_dialogue()
	$NinePatchRect/Name.text = dialogues[0]['name']
	$NinePatchRect/Message.text = dialogues[0]['text']
#	$NinePatchRect/Name.text = ("HOW TO PLAY")
#	$NinePatchRect/Message.text = ("W, Up Arrow or Space - Jump\nA,D or Left/Right arrow keys to move")

func _input(event):
	if event.is_action_pressed("dialogue_interact"):
		next_line()

func next_line():
#	$NinePatchRect/Message.text = ("Collect all the coins to get to the next level")
	$NinePatchRect/Name.text = dialogues[1]['name']
	$NinePatchRect/Message.text = dialogues[1]['text']

func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())


#video at 3:37
