@icon("InventoryIco.svg")
extends Resource
class_name Inventory

@export var EntityName: String
@export var Slot: Dictionary[int,Item] = {}

#insert an item. WARNING it Overwrite the item inside the slot
func InsertItemInSlot(item:Item,slot:int) -> void:
	Slot[slot]=item

#Swaps the item of two slots if item is the same it ads it to the stack
#Use FORCE_SWAP true to force the swap of the similar item preventing it to add it to the stack
func SwapItem(item:Item,destination_slot:int,FORCE_SWAP:bool=false) ->void:
	var temporal
	for x in Slot:
		if Slot[x]==item:
			if Slot[x]==null || Slot[x].Name!=Slot[destination_slot].Name || FORCE_SWAP:
				temporal = Slot[x]
				Slot[x] = Slot[destination_slot]
				Slot[destination_slot] = temporal
				return
			if Slot[x].Name==Slot[destination_slot].Name:
				var qt = Slot[destination_slot].quantity + Slot[x].quantity
				var NEWI = Slot[destination_slot].duplicate()
				Slot[destination_slot] = NEWI
				Slot[destination_slot].quantity = qt
				Slot[x]=null
				return

func GetItem(slot:int) -> Item:
	return Slot[slot]

func GetSlot(item:Item) -> int:
	for x in Slot:
		if Slot[x]==item:
			return x
	
	return -1
