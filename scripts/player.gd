extends CharacterBody2D


#Variabelen en Const's

var NPC_interact = false
var parry = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if direction == 1:
		$Sprite_MC.play("Walking")
		$Sprite_MC.flip_h = false

	if direction == 0:
		$Sprite_MC.play("Idle")

	if direction == -1:
		$Sprite_MC.play("Walking")
		$Sprite_MC.flip_h = true

	if Input.is_action_just_pressed("interact") and NPC_interact == true:
		print("hi there!")
	


	if Input.is_action_just_pressed("block"):
		parry = true

	#if parry == true:


#func _on_npc_1_body_entered(body: Node2D) -> void:
	#$"../NPC_1/E_Press".position = $"../NPC_1/Marker2D".position
	#NPC_interact = true
#
#
#func _on_npc_1_body_exited(body: Node2D) -> void:
	#$"../NPC_1/E_Press".position.y = 500
	#NPC_interact = false


func _on_timer_timeout() -> void:
	print("timer has passed")
	
