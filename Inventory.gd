@icon("InventoryIco.svg")
extends Resource
class_name Inventory

@export var EntityName: String
@export var Slot: Dictionary[int,Item] = {}

#insert an item WARNING it Overwrite the item inside the slot
func InsertItemInSlot(item:Item,slot:int) -> void:
	Slot[slot]=item

#Swaps the item of two slots
func SwapItem(item:Item,destination_slot:int) ->void:
	var temporal
	for x in Slot:
		if Slot[x]==item:
			temporal = Slot[x]
			Slot[x] = Slot[destination_slot]
			Slot[destination_slot] = temporal

func GetItem(slot:int) -> Item:
	return Slot[slot]

func GetSlot(item:Item) -> int:
	for x in Slot:
		if Slot[x]==item:
			return x
	
	return -1
