extends KinematicBody2D

signal grounded_updated(is_grounded)
signal change_hh_spawn

var velocity = Vector2(0,0)
var is_grounded

const SPEED = 320

export var fallMultiplier = 2
export var lowJumpMultiplier = 10
export var jumpVelocity = 400
export var gravity = 8

onready var jumpTimer = $JumpBufferTimer
onready var coyoteTimer = $CoyoteTimer

func _process(delta):
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

	elif velocity.y < 0 && Input.is_action_just_released("jump"): 
		velocity += Vector2.UP * (-7.81) * (lowJumpMultiplier) 

	velocity = move_and_slide(velocity,Vector2.UP)
	var was_grounded = is_grounded
	is_grounded = is_on_floor()
	
	if was_grounded == null || is_grounded != was_grounded:
		emit_signal("grounded_updated", is_grounded)
	velocity.x = lerp(velocity.x,0,0.3)
	
	if Input.is_action_just_pressed("jump"):
		jumpTimer.start()
		
	if is_on_floor():
		coyoteTimer.start()
		if !jumpTimer.is_stopped():
			jump()
	else:
		$Sprite.play("Air")
		if coyoteTimer.is_stopped():
			velocity.y += gravity
		elif !jumpTimer.is_stopped():
			jump()

func jump():
	$JumpSound.play()
	velocity = Vector2.UP * jumpVelocity
	jumpTimer.stop()
	coyoteTimer.stop()

func _on_Area2D_body_entered(body):
	SaveSystem.add_death()
	emit_signal("change_hh_spawn")
