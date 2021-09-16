extends Node

var xPos
var zPos
var mesh
var noise
var chunkDimensions

signal biome(ID)

onready var grassTex = preload("res://Materials/Terrain_Grass.tres")
onready var nightGrassTex = preload("res://Materials/NightElfMaterials/NightElfTerrain_Grass.tres")

func _ready():
	randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = randi()
	noise.octaves = rand_range(5, 7)
	noise.period = rand_range(80, 90)
	
	var mesh = PlaneMesh.new()
	mesh.size = Vector2(50, 50) # Original = 20, 20
	mesh.subdivide_depth = 30
	mesh.subdivide_width = 30
	
	var surface = SurfaceTool.new()
	surface.create_from(mesh, 0)
	
	var arrayMesh = surface.commit()
	
	var dataTool = MeshDataTool.new()
	
	dataTool.create_from_surface(arrayMesh, 0)
	
	for i in range(dataTool.get_vertex_count()):
		var vertex = dataTool.get_vertex(i)
		vertex.y = noise.get_noise_3d(vertex.x, vertex.y, vertex.z) * 20 # rand_range(65,70) # Possible revert to make smooth like WoW
		
		dataTool.set_vertex(i, vertex)
	
	for i in range(arrayMesh.get_surface_count()): # Remove old!
		arrayMesh.surface_remove(i)

	dataTool.commit_to_surface(arrayMesh)
	surface.begin(Mesh.PRIMITIVE_TRIANGLES)
	surface.create_from(arrayMesh, 0)
	surface.generate_normals()
	
	var meshInstance = MeshInstance.new()
	meshInstance.mesh = surface.commit()
	
	meshInstance.create_trimesh_collision()
	
	var choice = rand_range(0, 2)
	if choice > 1:
		meshInstance.set_surface_material(0, nightGrassTex)
	else:
		meshInstance.set_surface_material(0, grassTex)
	emit_signal("biome", choice)
	
	add_child(meshInstance)

#func Create(noise, x, z, chunkSize):
#	self.xPos = x
#	self.zPos = z
#	self.noise = noise
#	self.chunkDimensions = chunkSize
