extends Control

signal open_book(opened)

@onready var observe_btn = get_node("TextureButton")
@onready var book = get_node("Book")
@onready var booktxt = get_node("book_txt")
var bookState = false

	

func _input(event):
	# 'E' to observe
	if event.is_action_pressed("Interact") and observe_btn.disabled == false and !bookState:
		#observe_btn._toggled(true)
		_on_texture_button_pressed()
	
	# 'Space' to open book
	if event.is_action_pressed("Toggle_Book"):
		if !bookState:
			book.visible = true
			booktxt.visible = false
			bookState = true
			open_book.emit(true)
		else:
			book.visible = false
			booktxt.visible = true
			bookState = false
			open_book.emit(false)
		
func _process(delta):
	pass

func _on_main_character_observe(activate):
	if activate:
		print("Test")
		observe_btn.disabled = false
		observe_btn.visible = true
	else:
		observe_btn.disabled = true
		observe_btn.visible = false

func _on_texture_button_pressed():
	print("Button clicked")
