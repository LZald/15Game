extends CharacterBody2D


const MAX_SPEED = 300.0
const ACCELERATION = 0.5
@onready var tile_1 = $"."

var speed = 0.0
var is_being_swittched = false

func switch(tile):
	var aux = tile_1.global_position
	tile_1.global_position = tile.global_position
	tile.global_position = aux


func _physics_process(delta):
	if is_being_swittched:
		speed = lerp(speed, MAX_SPEED, ACCELERATION * delta)
		velocity = global_position.direction_to(tile_1.global_position)

	move_and_collide(velocity)
