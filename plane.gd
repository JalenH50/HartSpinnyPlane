extends RigidBody2D

@onready var AnimatedPlane = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimatedPlane.play("glide")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("flap"):
		apply_force(Vector2(0,-2000))
		AnimatedPlane.play("flap")


func _on_animated_sprite_2d_animation_finished() -> void:
	if AnimatedPlane.animation == "flap":
		AnimatedPlane.play("glide")
