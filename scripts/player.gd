extends CharacterBody2D

const GRAVITY = 1200.0;
const SPEED = 450.0;
const JUMP_FORCE = 750.0;

@export var animPlayer : AnimationPlayer;

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta;
		animPlayer.play("jump");
		
	else:
		animPlayer.play("idle");
		if Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_FORCE; 
	
	var x = Input.get_axis("left","right");
	velocity.x = x * SPEED;
	
	move_and_slide()
