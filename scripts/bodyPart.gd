extends RigidBody2D

onready var audioHurt = get_node("hurtSound")

func _ready():
	self.contact_monitor = true
	self.contacts_reported = 1
	self.connect("body_entered",self,"_on_body_entered")
	self.add_to_group("bodyparts")

func _on_body_entered(body):
	if not body.is_in_group("bodyparts"):
		audioHurt.play()
