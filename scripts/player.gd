extends Node

# Ball move speed in pixels per second
@export var move_speed: float = 500.0
@export var shot_scene: PackedScene
@export var ready_sprite: Texture2D
@export var cooldown_sprite: Texture2D
# Location node
var location: PathFollow2D
var sprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
    location = get_node("ShotPath/ShotLocation")
    sprite = get_node("ShotPath/ShotLocation/Sprite2D")
    sprite.texture = ready_sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    location.progress += move_speed * delta
    if Input.is_action_just_pressed("drop_ball") and $ShotCooldown.is_stopped():
        drop_ball()


func drop_ball():
    $ShotCooldown.start()
    sprite.texture = cooldown_sprite
    var shot = shot_scene.instantiate()
    shot.position = location.global_position
    add_child(shot)


func _on_shot_cooldown_timeout():
    sprite.texture = ready_sprite
