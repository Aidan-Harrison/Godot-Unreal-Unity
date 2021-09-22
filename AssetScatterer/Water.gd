extends MeshInstance

onready var blueWater = preload("res://Materials/Water.tres")
onready var purpleWater = preload("res://Materials/purpleWater.tres")

signal waterLevel(level)

func _ready():
	randomize()
	var height = rand_range(-1, 0.15)
	translation.y = height
	emit_signal("waterLevel", translation.y + 0.5) # Return to this!
	$AnimationPlayer.play("Main")
	# Colour

func _on_TerrainChunk_biome(ID):
	if ID > 1:
		set_surface_material(0, purpleWater)
	else:
		set_surface_material(0, blueWater)
