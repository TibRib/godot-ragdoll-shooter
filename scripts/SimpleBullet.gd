extends RigidBody2D
export var damage = 10

func _ready():
	self.connect("body_entered",self,"_on_body_entered")

func _on_body_entered(body):
	if not body.is_in_group("Weapon"):
		body.hit(damage)
		queue_free()

func launch_from(launcher, force):
	self.global_position = launcher.global_position
	var dir = launcher.global_transform.x
	apply_central_impulse(dir * force)
