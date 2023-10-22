extends Control

signal open_book(opened)

@onready var observe_btn = get_node("TextureButton")
@onready var book = get_node("Book")
@onready var booktxt = get_node("book_txt")
@onready var azalea = get_node("Azalea")
@onready var flower = get_node("Random Flower")
@onready var beautyberry = get_node("Beautyberry")

var bookState = false
var collidedObject

	

func _input(event):
	# 'E' to observe
	if event.is_action_pressed("Interact") and (azalea.visible or flower.visible or beautyberry.visible):
		azalea.visible = false
		flower.visible = false
		beautyberry.visible = false
	elif event.is_action_pressed("Interact") and !observe_btn.disabled and !bookState:
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
		observe_btn.disabled = false
		observe_btn.visible = true
	else:
		observe_btn.disabled = true
		observe_btn.visible = false

func _on_texture_button_pressed():	

	if collidedObject.is_in_group("Azalea") and !azalea.visible:
		azalea.visible = true
	elif collidedObject.is_in_group("Beautyberry") and !beautyberry.visible:
		beautyberry.visible = true
	elif collidedObject.is_in_group("Flower") and !flower.visible:
		flower.visible = true


func _on_main_character_collided_object(collision):
	collidedObject = collision

