extends Node2D

var Laser = preload("res://projectiles/PlayerLaser.tscn")

@onready var background_music = $AudioStreamPlayer  # Corrected reference to AudioStreamPlayer

func _on_Player_spawn_laser(location):
	var l = Laser.instance()
	l.global_position = location
	add_child(l)

func _ready():
	background_music.play()  # Start playing the background music
