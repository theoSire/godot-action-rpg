extends Area2D

const HitEffect = preload("res://Action RPG Resources/Effects/HitEffect.tscn")

var invincible = false setget set_invincible

onready var timer = $Timer

signal invincibility_started
signal invincibility_ended

func set_invincible(value):
	invincible = value # since self is not included, the setter is not called
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position
	effect.queue_free()
	
func _on_Timer_timeout():
	self.invincible = false #Adding the self calls the setter

func _on_Hurtbox_invincibility_ended():
	monitoring = true

func _on_Hurtbox_invincibility_started():
	set_deferred("monitoring", false)
