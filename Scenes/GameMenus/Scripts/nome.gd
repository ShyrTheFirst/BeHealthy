extends Label

@onready var horario: Label = $Horario

var nome_item : String = ""
var horario_item : String = "08:00"

func _ready() -> void:
	text = nome_item
	horario.text = horario_item


func _on_button_pressed() -> void:
	if GameManager.meds_list.has(nome_item):
		GameManager.meds_list.erase(nome_item)

	elif GameManager.consultas_list.has(nome_item):
		GameManager.consultas_list.erase(nome_item)
	queue_free()
