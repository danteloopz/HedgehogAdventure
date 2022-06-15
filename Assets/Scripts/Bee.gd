extends KinematicBody2D

var velocity = Vector2()
export var direction  = -1

func _ready():
	pass

func _physics_process(delta):
	if direction == 1:
		$AnimatedSprite.flip_h = false
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	
	
	
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
