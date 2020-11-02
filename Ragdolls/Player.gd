extends "res://Ragdolls/Body.gd"

var drag_enabled = false
var drag_pos : Vector2

var hand
var has_a_gun = false
var current_gun = null

var t = 0

func _ready():
	hand = get_node("ArmR/ArmR2")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			drag_enabled = event.pressed
		if event.button_index == BUTTON_RIGHT:
			if has_a_gun:
				current_gun.shoot(hand)

func _physics_process(delta):
	if drag_enabled:
		getmp()
	
	if Input.is_action_pressed("shoot"):
		if has_a_gun:
			if(t >= 0.5):
				current_gun.shoot(hand)
				t=0
			else:
				t+= delta

func getmp():
	var mp = get_global_mouse_position()
	var rp = mp - hand.global_transform.origin
	hand.apply_central_impulse(rp)

func equip(item):
	if current_gun != null:
		call_deferred(current_gun.queue_free())
		current_gun = null
		has_a_gun = false
	print("equipping "+item.name)
	var holder= $ArmR/ArmR2/WeaponHolder
	item.get_parent().remove_child(item)
	$ArmR/ArmR2/WeaponHolder.add_child(item)
	item.global_transform.origin = holder.global_transform.origin
	item.rotation = - holder.get_global_transform().get_rotation()
	has_a_gun = true
	current_gun = item
