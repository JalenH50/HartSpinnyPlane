extends Node2D

@export var rock_resource: PackedScene
@onready var game_over_control = get_node("GameOver")
@onready var hit_sound = $sfx/thud
@onready var rock_timer = $rock_timer
@onready var plane_resource: PackedScene
var new_plane : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rock_resource = preload("res://rock.tscn")
	plane_resource = preload("res://plane.tscn")
	new_plane = plane_resource.instantiate()
	new_plane.position = Vector2(150, 275)
	add_child(new_plane)

func plane_hit():
	game_over_control.visible = true
	var animation_player = game_over_control.get_node("AnimationPlayer")
	animation_player.play("slide in")
	hit_sound.play()
	rock_timer.stop()

func _on_rock_timer_timeout() -> void: #I altered the numbers here to make it easier to spawn tops and bottoms
	if randf() < 0.5:
		var top_or_bottom = randi() % 2
		if top_or_bottom == 0:
			var new_rock = rock_resource.instantiate()
			new_rock.position = Vector2(1200,300)
			add_child(new_rock)
		if top_or_bottom == 1:
			var new_rock = rock_resource.instantiate()
			new_rock.rotate(3.14159)
			new_rock.position = Vector2(1200,-150)
			add_child(new_rock)

func _on_button_pressed() -> void:
	rock_timer.start()
	new_plane.position = Vector2(150, 275)
	game_over_control.visible = false
