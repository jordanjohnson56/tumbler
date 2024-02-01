extends RigidBody2D

@export var launch_force: float = 50.0

func launch(centerpoint: Vector2):
    apply_central_impulse((position - centerpoint) * launch_force)

func _on_visible_on_screen_notifier_2d_screen_exited():
    queue_free()
