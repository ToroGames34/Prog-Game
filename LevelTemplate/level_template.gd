extends Node2D


@onready var LabelMainQuest: Label = $ControlObjs/LabelQuestions/LabelQuest
@onready var ImgQ1: TextureRect = $ControlObjs/ImgAnswers/GridContainer/ImgOption1/VBoxContainer/Img
@onready var ImgQ2: TextureRect = $ControlObjs/ImgAnswers/GridContainer/ImgOption2/VBoxContainer/Img
@onready var ImgQ3: TextureRect = $ControlObjs/ImgAnswers/GridContainer/ImgOption3/VBoxContainer/Img
@onready var ImgQ4: TextureRect = $ControlObjs/ImgAnswers/GridContainer/ImgOption4/VBoxContainer/Img

@onready var respons_screen: Control = $CanvasLayer/ResponsScreen

var DicQuestion1: Dictionary = {
	"Question": "¿Cuál de estos códigos genera la secuencia 2 - 4 - 6 - 8 - 10?",
	"Img1": load("res://Assets/2 - 4 - 6 - 8 - 10/Screenshot 2025-08-22 173045.png"),
	"Img2": load("res://Assets/2 - 4 - 6 - 8 - 10/Screenshot 2025-08-22 173126.png"),
	"Img3": load("res://Assets/2 - 4 - 6 - 8 - 10/Screenshot 2025-08-22 173145.png"),
	"Img4": load("res://Assets/2 - 4 - 6 - 8 - 10/Screenshot 2025-08-22 173213.png"),
	"QCorrect": "Op1"
}

var CorrectAsw: String
var UserRespond: String
var CanRespondOneTime: bool = true


func _ready() -> void:
	respons_screen.ResetPanel()
	
	LoadQuestions(DicQuestion1)#Take out later


func LoadQuestions(dicQ: Dictionary) -> void:
	LabelMainQuest.text = dicQ.Question
	ImgQ1.texture = dicQ.Img1
	ImgQ2.texture = dicQ.Img2
	ImgQ3.texture = dicQ.Img3
	ImgQ4.texture = dicQ.Img4
	CorrectAsw = dicQ.QCorrect


func _on_button_pressed_Op1() -> void:
	CheckCorrectAnws("Op1")
	print("op1")


func _on_button_pressed_Op2() -> void:
	CheckCorrectAnws("Op2")
	print("Op2")


func _on_button_pressed_Op3() -> void:
	CheckCorrectAnws("Op3")
	print("Op3")


func _on_button_pressed_Op4() -> void:
	CheckCorrectAnws("Op4")
	print("Op4")


func CheckCorrectAnws(respon: String) -> void:
	if CanRespondOneTime:
		CanRespondOneTime = false
		UserRespond = respon
		
		if UserRespond == CorrectAsw:
			ShowCorrectAnim()
		else:
			ShowIncorrectAnim()


func ShowCorrectAnim() -> void:
	respons_screen.ShowAnwer(1)


func ShowIncorrectAnim() -> void:
	respons_screen.ShowAnwer(0)


func _on_respons_screen_accept() -> void:
	CanRespondOneTime = true
