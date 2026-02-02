extends Area2D

@export var speed = 150
var hp = 1

# Called every frame, this handles the enemy's movement.
func _physics_process(delta):
	global_position.y += speed * delta

# Called when the enemy takes damage
func take_damage(damage):
	hp -= damage
	print("Enemy takes damage! HP: ", hp)  
	if hp <= 0:
		queue_free()  

func _on_area_entered(area: Area2D):
	if area is Player:  
		area.take_damage(1)  
