extends Control

@onready var RefImage = $Image
@onready var CreditText = $RichTextLabel
var toggle = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Credits"):
		toggle = not toggle
		
		RefImage.visible = toggle
		CreditText.visible = toggle
