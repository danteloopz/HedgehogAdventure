extends KinematicBody2D

signal grounded_updated(is_grounded)

var velocity = Vector2(0,0)
var coins = 0
var is_grounded

const SPEED = 320
const GRAVITY = 30

export var jump_height : float
export var jump_time_to_peak : float
export var jump_time_to_descent : float

onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

func _process(delta):
	velocity.y += _get_gravity() * delta
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("Idle")
	
	if not is_on_floor():
		$Sprite.play("Air")
	
	velocity = move_and_slide(velocity,Vector2.UP)
	var was_grounded = is_grounded
	is_grounded = is_on_floor()
	
	if was_grounded == null || is_grounded != was_grounded:
		emit_signal("grounded_updated", is_grounded)
	velocity.x = lerp(velocity.x,0,0.25)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
	
	if coins == 3: 
		pass

func _get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
	velocity.y = jump_velocity
	
func add_coin():
	coins = coins + 1

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Assets/Scenes/Level1.tscn")
