extends Control

@onready var page1 = get_node("TextureRect")
@onready var page2 = get_node("TextureRect2")
@onready var page3 = get_node("TextureRect3")

@onready var pages = get_children()

var pageState = false
var page = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	print(pages)


func _on_texture_button_2_pressed():
	if page > 0:
		pages[page - 1].visible = true
		pages[page].visible = false
		page-=1
	
	print("left page")


func _on_texture_button_pressed():
	if page < 2:
		pages[page + 1].visible = true
		pages[page].visible = false
		page+=1
	
	print("right page")
