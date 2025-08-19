@icon("ItemIco.svg")
extends Resource
class_name Item

@export var Name: String

@export var Sprite: Texture2D

@export var Stats: Dictionary[String,int] = {}

@export_range(1,99999,1) var Max_Stack: int
@export_range(1,99999,1) var quantity: int

func GetStatValue(name:String) -> int:
	return Stats[name]

func IsOverFlow() -> bool:
	if Max_Stack <= quantity:
		return true
	return false
