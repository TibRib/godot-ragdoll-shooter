extends RigidBody2D

func _ready():
	setRandomColor()

func setRandomColor():
	setColor(self, randf(),randf(),randf())

func setColor(node, r,g,b):
	for c in node.get_children():
		if c.get_child_count() > 0:
			setColor(c, r,g,b)
		else:
			if c is Sprite:
				c.modulate = Color(r,g,b)
