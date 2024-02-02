extends Node

# Ball move speed in pixels per second
@export var move_speed: float = 500.0
@export var shot_scene: PackedScene
@export var ready_sprite: Texture2D
@export var cooldown_sprite: Texture2D
@export var initial_size: float = 0.4
# Location node
var location: PathFollow2D
var sprite: Sprite2D
var shot_size: float

# Called when the node enters the scene tree for the first time.
func _ready():
    location = get_node("ShotPath/ShotLocation")
    sprite = get_node("ShotPath/ShotLocation/Sprite2D")
    sprite.texture = ready_sprite
    sprite.scale = Vector2(initial_size, initial_size)
    shot_size = initial_size


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
    shot.set_size(shot_size)
    add_child(shot)


func _on_shot_cooldown_timeout():
    sprite.texture = ready_sprite
