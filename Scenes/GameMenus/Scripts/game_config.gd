extends Control

const ADD_INFOS = preload("res://Scenes/GameMenus/add_infos.tscn")
const NOME = preload("res://Scenes/GameMenus/nome.tscn")
@onready var medicamentos: GridContainer = $Panel/MedicamentosAdd/MedScroll/Medicamentos
@onready var consultas: GridContainer = $Panel/ConsultasAdd/ConsultasScroll/Consultas

func _on_add_med_pressed() -> void:
	var add = ADD_INFOS.instantiate()
	add.med = true
	add_child(add)


func _on_add_con_pressed() -> void:
	var add = ADD_INFOS.instantiate()
	add.med = false
	add_child(add)


func _on_finalizar_pressed() -> void:
	print(GameManager.consultas_list)
	print(GameManager.meds_list)
	GameManager.FirstPlay = false
	get_tree().change_scene_to_file("res://Scenes/GameMenus/rest_screen.tscn")


func add_med(nome,hora,min, med = true):
	var add_nome = NOME.instantiate()
	add_nome.nome_item = nome
	add_nome.horario_item = hora + ":" + min
	if med:
		GameManager.meds_list[nome] = hora + ":" + min
		medicamentos.add_child(add_nome)
	else:
		GameManager.consultas_list[nome] = hora + ":" + min
		consultas.add_child(add_nome)
