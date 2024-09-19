extends Area2D

@export var speed: float

func _process(delta: float) -> void:
	position.x -= speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "plane":
		var root = get_tree().root.get_node("SpinnyPlane")
		root.call("plane_hit")
