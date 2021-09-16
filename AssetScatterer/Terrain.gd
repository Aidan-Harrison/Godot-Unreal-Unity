extends Spatial

onready var chunk = preload("res://TerrainChunk.tscn")

var noise
var thread

func _ready():
	randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = randi()
	noise.octaves = 6
	noise.period = 80
	thread = Thread.new()

func Generate():
	
	chunk.Create()
	pass
