extends Node

@export var initial_state : EnemyState
@export var enemy_node : CharacterBody2D
@export var animation_player_node : CharacterAnimationPlayer
@export var debug_text : Label
var current_state: EnemyState
var states: Dictionary = {}
var pending_context: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is EnemyState :
			states[child.name.to_lower()] = child
			child.enemy = enemy_node
			child.animation = animation_player_node
			child.Transition.connect(on_state_transition)
	if initial_state:
		initial_state.enter()
		current_state = initial_state
		if debug_text != null: 
			debug_text.text = initial_state.name





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_state.frame_update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)





func on_state_transition(source_state:EnemyState, new_state_name:String, context:Dictionary = {}):
	if source_state!=current_state :
		print_debug("State passing as argument is not the current state: source state = " + source_state.name + " current state = " + current_state.name )
		return
		
	var new_state : EnemyState = states.get(new_state_name.to_lower())
	if !new_state :
		print_debug("State that is transitioned into does not exist")
		return
		
	if current_state :
		current_state.exit()
	else:
		print_debug("State machine's current state is lost")
	
	new_state.enter(context)
	if debug_text: 
		debug_text.text = new_state_name
	current_state = new_state
