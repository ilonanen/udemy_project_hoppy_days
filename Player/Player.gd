extends KinematicBody2D

var motion = Vector2(0,0) # x, y

const SPEED = 1200 # * delta
const GRAVITY = 150 # * delta
const UP = Vector2(0, -1)
const JUMP_SPEED = 3100
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 1.75

signal animate

func _physics_process(_delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	

func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "end_game")
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY # y suurenee alaspäin liikkuessa
		
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED		
	else:
		motion.x = 0


func animate():
	emit_signal("animate", motion)
	
	
func hurt():
	position.y -= 1 # to bypass gravity
	yield(get_tree(), "idle_frame") # to bypass gravity
	motion.y -= JUMP_SPEED * 0.75
	$PainSFX.play()
		
		
func boost():
	position.y -= 1 # to bypass gravity
	yield(get_tree(), "idle_frame") # to bypass gravity
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER
