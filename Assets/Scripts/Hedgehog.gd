extends KinematicBody2D

signal grounded_updated(is_grounded)

var velocity = Vector2(0,0)
var coins = 0
var is_grounded

const SPEED = 320

export var fallMultiplier = 2
export var lowJumpMultiplier = 10
export var jumpVelocity = 400
export var gravity = 8

func _process(delta):
	velocity.y += gravity
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
	
	if velocity.y > 0: 
		velocity += Vector2.UP * (-7.81) * (fallMultiplier) 

	elif velocity.y < 0 && Input.is_action_just_released("ui_accept"): 
		velocity += Vector2.UP * (-7.81) * (lowJumpMultiplier) 
		
	if not is_on_floor():
		$Sprite.play("Air")
	
	velocity = move_and_slide(velocity,Vector2.UP)
	var was_grounded = is_grounded
	is_grounded = is_on_floor()
	
	if was_grounded == null || is_grounded != was_grounded:
		emit_signal("grounded_updated", is_grounded)
	velocity.x = lerp(velocity.x,0,0.3)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity = Vector2.UP * jumpVelocity
	
	if coins == 3: 
		pass
	
func add_coin():
	coins = coins + 1

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Assets/Scenes/Level1.tscn")
