extends Control

signal accept

@onready var BG_mesage: ColorRect = $ColorRect
@onready var CorrectImg: TextureRect = $ColorRect/Correct
@onready var IncorrectImg: TextureRect = $ColorRect/Incorrect
@onready var button_accept: Button = $ButtonAccept
@onready var Bg: ColorRect = $BG

var Message: Array

func _ready() -> void:
	visible = false
	BG_mesage.visible = false
	Bg.visible = false
	Message = [IncorrectImg, CorrectImg]
	ResetPanel()
	button_accept.visible = false


func ShowAnwer(v: int) -> void:
	match v:
		0:
			AnimShowMessage(v)
		1:
			AnimShowMessage(v)


func AnimShowMessage(v: int) -> void:
	var tween: Tween = get_tree().create_tween()
	
	visible = true
	var ImgAnwer: TextureRect = Message[v]
	Bg.visible = true
	BG_mesage.visible = true
	ImgAnwer.visible = true
	ImgAnwer.scale = Vector2(0.4, 0.4)
	
	tween.tween_property(ImgAnwer, "scale", Vector2(1, 1), 1).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	
	ShowButton()
	
	#await tween.tween_interval(8).finished
	#ResetPanel()


func ResetPanel() -> void:
	visible = false
	BG_mesage.visible = false
	Bg.visible = false
	for i: TextureRect in Message:
		i.visible = false
		i.scale = Vector2(0.4, 0.4)


func ShowButton() -> void:
	await get_tree().create_timer(2).timeout
	button_accept.visible = true


func _on_button_accept_pressed() -> void:
	ResetPanel()
	button_accept.visible = false
	emit_signal("accept")
