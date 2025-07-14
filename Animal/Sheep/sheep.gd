extends CharacterBody2D
class_name Farm_Animal

@onready var Component : Node = get_node("Component")
@onready var Stats : Node = get_node("Component/Stats")

var Deltas : float = 0

var State : String = "Idle"
var Facing : Vector2 = Vector2(0,0)
var Speed : float = 50
var MoveDir : Vector2 = Vector2(0,0)

var CanPick : bool = false
func _ready():
	pass

func _physics_process(delta):
	Deltas = delta
	AI()
	var TargetVel = MoveDir * Speed
	velocity = velocity.lerp(TargetVel,delta)
	
	move_and_slide()

	# Reverse direction if out of bounds

func AI():

	match State:
		"Idle":Speed = Speed - Speed/10 if Speed >= 1 else 0
		
		"Move":
			Speed = Speed + 0.5 if Speed <= 50 else 50
			if is_on_ceiling() or is_on_floor() : MoveDir.y *= -1
			if is_on_wall(): MoveDir.x *= -1
		"Pick":
			global_position = global_position.lerp(get_global_mouse_position()-Vector2(0,-20),0.1) 
			MoveDir = Vector2.ZERO

		


func Random_dir():
	var X = randf_range(-1,1)
	var Y = randf_range(-1,1)
	var resultDir = Vector2(X,Y)
	print(resultDir)
	return resultDir.normalized()


func _on_timer_timeout() -> void:
	if State == "Pick":return
	State = ["Idle","Move","Move"].pick_random()
	print(State)
	match State:
		"Idle":MoveDir = Vector2.ZERO ; 
		"Move":MoveDir = Random_dir()
	
func _mouse_enter() -> void:
	CanPick = true
func _mouse_exit() -> void:
	CanPick = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and (CanPick == true or State == "Pick"):
			State = "Pick" if State != "Pick" else "Idle"
			
