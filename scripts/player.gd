extends Node

# Ball move speed in pixels per second
@export var move_speed: float = 500.0
# Location node
var location: PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready():
    location = get_node("ShotPath/ShotLocation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    location.progress += move_speed * delta
