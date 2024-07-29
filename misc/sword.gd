extends Node2D


@export var upgrade_amount: int = 1


func _ready():
	$Area2D.body_entered.connect(on_body_entered)
	
	
func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var player: Player = body
		player.strength(upgrade_amount)
		player.damage_collected.emit(upgrade_amount)
		queue_free()
	
