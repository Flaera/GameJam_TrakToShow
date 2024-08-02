extends CharacterBody3D

var speed = 200
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
const RAY_LENGTH = 1000.0
@onready var trigger_pos: Vector3 = Vector3.ZERO

func _ready():
	get_node("Camera3D").current=true


func _physics_process(delta):
	if (!is_on_floor()):
		velocity.y-=speed*delta
	velocity = trigger_pos - self.position
	#self.position = lerp(self.position, self.position-trigger_pos, delta*200)
	move_and_slide()


func get_pos(event, position):
	if event is InputEventMouse:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			trigger_pos = position
			print("pos=",position)


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	get_pos(event,position)


func _on_area_3d_2_input_event(camera, event, position, normal, shape_idx):
	get_pos(event,position)
