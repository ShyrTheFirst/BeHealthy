extends Control

@onready var nome: LineEdit = $Panel/Nome
@onready var hora: LineEdit = $Panel/Hora
@onready var min: LineEdit = $Panel/Min

var med : bool = false
var nome_check : bool = false
var hora_check : bool = false
var min_check : bool = false
var can_exit : bool = false
var hora_list : Array = ["00","01","02","03","04","05","06","07","08","09"]
var min_list : Array = ["00","01","02","03","04","05","06","07","08","09"]

func _ready() -> void:
	for num in range(10, 60):
		min_list.append(str(num))

	for num in range(10,25):
		hora_list.append(str(num))

func _on_confirmar_pressed() -> void:
	for i in hora_list:
		if hora.text == i:
			hora_check = true

	for i in min_list:
		if min.text == i:
			min_check = true

	if nome.text != "":
		nome_check = true
	
	if nome_check and hora_check and min_check:
		can_exit = true
	else:
		can_exit = false

	if can_exit:
		get_parent().add_med(nome.text, hora.text, min.text, med)
		queue_free()


#if med -> pesquisar o nome do medicamento enquanto escreve?
