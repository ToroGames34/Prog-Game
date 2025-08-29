extends Control

@onready var BG_mesage: ColorRect = $ColorRect
@onready var CorrectImg: TextureRect = $ColorRect/Correct
@onready var IncorrectImg: TextureRect = $ColorRect/Incorrect
@onready var button_accept: Button = $ButtonAccept

var Message: Array

func _ready() -> void:
	BG_mesage.visible = false
	Message = [IncorrectImg, CorrectImg]
	ResetPanel()
	button_accept.visible = false
	ShowAnwer(1)


func ShowAnwer(v: int) -> void:
	match v:
		0:
			AnimShowMessage(v)
		1:
			AnimShowMessage(v)


func AnimShowMessage(v: int) -> void:
	var tween: Tween = get_tree().create_tween()
	
	var ImgAnwer: TextureRect = Message[v]
	BG_mesage.visible = true
	ImgAnwer.visible = true
	ImgAnwer.scale = Vector2(0.4, 0.4)
	
	tween.tween_property(ImgAnwer, "scale", Vector2(1, 1), 1).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	
	ShowButton()
	
	await tween.tween_interval(8).finished
	ResetPanel()


func ResetPanel() -> void:
	BG_mesage.visible = false
	for i: TextureRect in Message:
		i.visible = false
		i.scale = Vector2(0.4, 0.4)


func ShowButton() -> void:
	await get_tree().create_timer(2).timeout
	button_accept.visible = true


func _on_button_accept_pressed() -> void:
	ResetPanel()
	button_accept.visible = false
