extends PlayerState

# State: jumping
# behavior:
#	play the jumping animation
#	launches character into the air
#	follow passive physic (gravity)
# trasition:
#	character is no longer jumping "up" -> falling
#	player landed -> idling/running 
#	player presses jump and character can jump -> jumping (self)
#	player presses dash and character can dash -> dashing
#	player presses attack -> attack
#	character is hit by an enemy -> delegate to character's reveive_hit signal (to hurt state)

@onready var jump_ve: CPUParticles2D = %jump_VE

func enter(context:Dictionary = {}) -> void:
	super()
	
	animation.play("jumping")
	AudioController.play_sound("Jump")
	
	#print_debug("entering JUMPING state")

func exit() -> void:
	super()
	pass

func frame_update(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	animation.flip_sprite(direction)

func physics_update(delta: float) -> void:
	# Physic logic
	var direction := Input.get_axis("left", "right")
	if direction:
		var target_speed :float = direction * player.SPEED
		player.velocity.x = move_toward(player.velocity.x,target_speed, player.ACCELERATION * delta)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.FRICTION * delta)
	
	player.velocity += player.get_gravity() * delta	
	player.move_and_slide()
	
	# Transition logic
	if player.velocity.y > 0: # player no longer jumping UP -> falling state
		Transition.emit(self,"falling")
	if player.is_on_floor(): # player just landed and...
		if direction: # ...directional input is present -> running state
			Transition.emit(self,"running")
		else: # ...directional input in absent -> idling state 
			Transition.emit(self,"idling")
		

func on_player_event(event: String) :
	match event:
		"jump":
			if player.jump_count < player.max_jump:
				player.velocity.y = - player.JUMP_VELOCITY
				player.jump_count += 1
				jump_ve.emitting = true
				AudioController.play_sound("Jump")
		"dash":
			if player.dash_count < player.max_dash :
				player.dash_count += 1
				Transition.emit(self,"dashing")
		"attack":
			Transition.emit(self,"attacking")
		_:
			pass
	
func on_player_hit(context: Dictionary):
	super(context)
