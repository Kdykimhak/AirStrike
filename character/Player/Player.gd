extends Area2D
class_name Player

signal spawn_laser(location)

@onready var muzzle = $Muzzle 

var speed = 300
var input_vector = Vector2.ZERO
var hp = 3

var laser_scene = preload("res://projectiles/PlayerLaser.tscn")  

func _ready():
	connect("spawn_laser", Callable(self, "_on_spawn_laser"))


func _process(delta):

	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	position += input_vector.normalized() * speed * delta

	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()  

func _on_area_entered(area: Area2D):
	if area.is_in_group("enemies"):
		area.take_damage(1)


func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)


func _on_spawn_laser(location):
	var laser = laser_scene.instantiate() 
	laser.position = location  
	get_parent().add_child(laser) 
