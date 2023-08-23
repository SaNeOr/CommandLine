extends Control

@onready var logText := $HBoxContainer/VBoxContainer/LogText
@onready var commandInput := $HBoxContainer/VBoxContainer/CommandInput

var messages : PackedStringArray
var filter_txt : String
# Called when the node enters the scene tree for the first time.
func _ready():
	#Shortcut()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_clear_pressed():
	clear_message()

func _on_command_input_text_changed(new_text):
	#print(new_text)
	pass # Replace with function body.


func _on_command_input_text_submitted(new_text):
	var command :String = new_text
	var logLine = command + '\n'
	#messages.append(logLine)
	#logText.add_text(logLine)
	add_message(logLine)
	commandInput.clear()


func _on_filter_message_text_changed(new_text):
	filter_txt = new_text
	var new_line : String = filter_txt
	#print(new_line)
	rebuild_log()
	#add_message(new_line)


func rebuild_log() -> void:
	logText.clear()
	for msg in messages:
		#print(msg)
		if filter_txt == "" || msg.contains(filter_txt):
			logText.add_text(msg)


func add_message(p_msg : String) -> void:
	messages.append(p_msg)
	rebuild_log()
	
func clear_message() -> void:
	messages.clear()
	rebuild_log()
