extends RigidBody2D

@export var launch_force: float = 500.0

func launch(centerpoint: Vector2):
    var direction = (position - centerpoint).normalized()
    var impulse = direction * launch_force
    apply_central_impulse(impulse)

func _on_visible_on_screen_notifier_2d_screen_exited():
    queue_free()
