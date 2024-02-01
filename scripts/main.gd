extends Node

@export var shot_scene: PackedScene
@export var peg_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
    $TestShotTimer.start()
    # Create grid of pegs
    for col in range(8):
        for row in range(4):
            var peg = peg_scene.instantiate()
            peg.position.x = 200 + col * 100
            peg.position.y = 200 + row * 100
            add_child(peg)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_test_shot_timer_timeout():
    var shot = shot_scene.instantiate()
    shot.position.y = 100
    shot.position.x = randf_range(100, 1180)
    add_child(shot)
