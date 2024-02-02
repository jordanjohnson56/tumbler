extends RigidBody2D

@export var rebound_force: float = 500.0
const BASE_RADIUS = 32

func set_size(size: float):
    $Sprite2D.scale = Vector2(size, size)
    var new_radius = size * BASE_RADIUS
    $CollisionShape2D.shape.radius = new_radius
    $VisibleOnScreenNotifier2D.rect.position = Vector2(-new_radius, -new_radius)
    $VisibleOnScreenNotifier2D.rect.size = Vector2(new_radius * 2, new_radius * 2)

func launch(centerpoint: Vector2):
    var direction = (position - centerpoint).normalized()
    var impulse = direction * rebound_force
    apply_central_impulse(impulse)

func _on_visible_on_screen_notifier_2d_screen_exited():
    queue_free()
