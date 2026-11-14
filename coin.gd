extends Area2D

signal collected

@onready var pickup_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collected.emit()
		pickup_sound.play()
		$CollisionShape2D.set_deferred("disabled", true)
		$Sprite2D.hide()
		await pickup_sound.finished
		queue_free()
