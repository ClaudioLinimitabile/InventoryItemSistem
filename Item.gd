@icon("ItemIco.svg")
extends Resource
class_name Item

@export var Name: String

@export var Sprite: Texture2D

@export var Stats: Dictionary[String,int] = {}

func GetStatValue(name:String) -> int:
	return Stats[name]
