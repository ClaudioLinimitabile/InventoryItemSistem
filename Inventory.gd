@icon("InventoryIco.svg")
extends Resource
class_name Inventory

@export var EntityName: String
@export var Slot: Dictionary[int,Item] = {}

#insert an item. WARNING it Overwrite the item inside the slot
func InsertItemInSlot(item:Item,slot:int) -> void:
	Slot[slot]=item

#Swaps the item of two slots if item is the same it ads it to the stack
#if item stack overflow the rest of the stack stays to te previous slot
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
				var rs = 0
				var qt = Slot[destination_slot].quantity + Slot[x].quantity
				if qt > Slot[x].Max_Stack:
					rs = qt - Slot[x].Max_Stack
					qt = Slot[x].Max_Stack
				var NEWI = Slot[destination_slot].duplicate()
				Slot[destination_slot] = NEWI
				Slot[destination_slot].quantity = qt
				if rs < 1:
					Slot[x]=null
				else:
					var NEWX = Slot[x].duplicate()
					Slot[x] = NEWX
					Slot[x].quantity = rs
				return

#create a new item whit quantity desired and returns it if u put over the quantity you get all
func SplitQuantity(item:Item,qt:int) -> Item:
	if item.quantity > qt:
		var newI = item.duplicate()
		newI.quantity = qt
		item.quantity -= qt
		return newI
	Slot[GetSlot(item)] = null
	return item


func GetItem(slot:int) -> Item:
	return Slot[slot]

func GetSlot(item:Item) -> int:
	for x in Slot:
		if Slot[x]==item:
			return x
	
	return -1
