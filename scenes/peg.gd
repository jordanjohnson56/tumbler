extends Area2D

signal hit

func explode():
    hit.emit()
    queue_free()


func _on_body_entered(body):
    if body.is_in_group("shot"):
        hit.emit()
        body.launch(position)
        queue_free()
