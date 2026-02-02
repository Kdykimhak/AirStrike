extends Node2D

var spawn_positions = []
var Enemy = preload("res://character/enemy/Enemy.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()

func spawn_enemy():
	var index = randi() % spawn_positions.size()
	var enemy = Enemy.instantiate() 
	enemy.global_position = spawn_positions[index].global_position
	add_child(enemy)
	print("Enemy spawned!")  

func _on_spawn_timer_timeout():
	spawn_enemy()
