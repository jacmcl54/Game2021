extends ParallaxLayer

#CHANGES THE SPEED THAT THE CLOUDS MOVE AT
export(float) var CLOUD_SPEED = -10

func _process(delta) -> void:
	self.motion_offset.x += CLOUD_SPEED * delta
