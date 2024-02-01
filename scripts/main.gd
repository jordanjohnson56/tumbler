extends Node

@export var peg_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
    # Create grid of pegs
    for col in range(8):
        for row in range(4):
            var peg = peg_scene.instantiate()
            peg.scale = Vector2(0.5,0.5)
            peg.position.x = 300 + col * 100
            peg.position.y = 250 + row * 100
            add_child(peg)
