extends Node

@export var Name : String = "Farm_Animal"
@export_enum("Common","Uncommon","Rare","Epic","Legendary","Mythic","Ancient") var Rarity : String = "Common"

@export var Breed : String = "Normal"
@export var Trait : String = "Normal"

@export var Mood : float = 100
@export var Hunger : float = 100

@export var Harvested : bool = false
