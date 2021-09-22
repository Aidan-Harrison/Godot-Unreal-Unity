extends StaticBody

const chunkSize = 50

var noise
var chunks = {}
var currentChunks = []
var unready_chunks = {}

var thread

onready var Chunk = preload("res://TerrainChunk.tscn")
onready var terrainMat = preload("res://Materials/Terrain_Grass.tres")

func _ready():
	randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = randi()
	noise.octaves = 6
	noise.period = 80
	
	thread = Thread.new()
	
func AddChunks(x, z):
	var key = str(x) + "," + str(z)
	if chunks.has(key) || unready_chunks.has(key):
		return
	
	if !thread.is_active():
		thread.start(self, "LoadChunk", [thread, x, z])
		unready_chunks[key] = 1

func LoadChunk(arr):
	var thread = arr[0]
	var x = arr[1]
	var z = arr[2]
	
	var chunk = Chunk.instance()
	chunk.Set(noise, x * chunkSize, z * chunkSize, chunkSize)
	chunk.Create()
	chunk.translation = Vector3(x * chunkSize, 0, z * chunkSize)
	currentChunks.append(chunk)
	
	call_deferred("LoadDone", chunk, thread)
	
func LoadDone(chunk, thread):
	add_child(chunk)
	var key = str(chunk.xPos / chunkSize) + "," + str(chunk.zPos / chunkSize)
	chunks[key] = chunk
	unready_chunks.erase(key)
	thread.wait_to_finish()

func GetChunk(x, z):
	var key = str(x) + "," + str(z)
	if chunks.has(key):
		return chunks.get(key)
	return null
	
func _process(_delta):
	for x in range(3):
		for z in range(3):
			AddChunks(x, z)
	for i in currentChunks:
		i.meshInstance.set_surface_material(0, terrainMat)
	
func UpdateChunks():
	pass
	
func CleanChunks():
	pass
