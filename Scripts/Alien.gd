extends CharacterBody3D


const speed = 2.0
const acceleration = 10.0

@onready var nav = $NavigationAgent3D
@onready var player: CharacterBody3D = get_parent().get_node("Player")
@onready var nav_target := player.get_node("NavTarget")

func _physics_process(delta):
	var direction = Vector3()
	
	nav.target_position = nav_target.global_position
	
	direction = (nav.get_next_path_position() - global_position).normalized()
	
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	
	move_and_slide()
	
