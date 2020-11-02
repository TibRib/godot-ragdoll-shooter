extends Node2D
class_name Gun

export var knockback = 100
export var force = 700
export(String, FILE, "*.tscn") var bullet_scene_path  : String = "res://assets/bullets/SimpleBullet.tscn"
onready var particleEmitter = $CPUParticles2D

onready var launcher = $BulletsLaunch

var equipped = false
var bullet_scn;

func _ready():
	bullet_scn = load(bullet_scene_path)

func shoot(owner):
	$ShootSound.play()
	var bullet = bullet_scn.instance()
	launcher.add_child(bullet)
	
	bullet.set_as_toplevel(true)
	
	bullet.global_position = launcher.global_position
	var dir = launcher.global_transform.x.normalized()
	
	bullet.linear_velocity = owner.linear_velocity + dir * force

func _on_zone_entered(body):
	if equipped == false:
		if body.is_in_group("Players"):
			body.equip(self)
			equipped = true
