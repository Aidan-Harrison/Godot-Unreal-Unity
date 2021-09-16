extends Spatial

# Other
var waterLevel

onready var asset1 = preload("res://Assets/Asset1.tscn")
onready var asset2 = preload("res://Assets/Asset2.tscn")
onready var asset3 = preload("res://Assets/Asset3.tscn")
onready var grass = preload("res://Assets/GeneralAssets/Grass.tscn")
onready var Log = preload("res://Assets/GeneralAssets/Log.tscn")
onready var mushroom = preload("res://Assets/GeneralAssets/GlowingPlant.tscn")
onready var giantMushroom = preload("res://Assets/GeneralAssets/GiantMushroom.tscn")
onready var tree = preload("res://Assets/GeneralAssets/Tree.tscn")
onready var bush = preload("res://Assets/GeneralAssets/Bush.tscn")
onready var largeBush = preload("res://Assets/GeneralAssets/LargeBush.tscn")
onready var stones = preload("res://Assets/GeneralAssets/Pebbles.tscn")

# Shore Assets
onready var pier = preload("res://Assets/ShoreAssets/Pier.tscn")

# Water Assets
onready var seaWeed = preload("res://Assets/WaterAssets/SeaWeed.tscn")
onready var lilyPad = preload("res://Assets/WaterAssets/LilyPad.tscn")

# Particles
onready var fireflies = preload("res://Assets/ParticleEffects/FireFlies.tscn")
onready var nightflies = preload("res://Assets/ParticleEffects/NightFlies.tscn")

var particles = []
var shoreAssets = []
var waterAssets = []
var assets = []

# Materials
onready var red = preload("res://Materials/Dirt.tres")
onready var green = preload("res://Materials/Grass.tres")
onready var blue = preload("res://Materials/Stone.tres")
onready var wood = preload("res://Materials/Wood.tres")
var materials = []

# Night Elf Biome
var isNightPlant = false
onready var nightElfGrass = preload("res://Assets/NightElfAssets/NightElfGrass.tscn")
onready var nightElfTree = preload("res://Assets/NightElfAssets/NightTree.tscn")
onready var nightElfPlant = preload("res://Assets/NightElfAssets/NightPlant.tscn")

var nightAssets = []

# General
var isGround = true
var isShore = false
var isHigh = false
var isWater = false
var isTree = false
var isLog = false
var isGrass = false
var isBush = false

var newAsset
var choice = 0

var biome : int = 0

var thread

func _ready(): # Add biome gen function instead
	# Models
	assets.append(asset1)
	assets.append(asset2)
	assets.append(asset3)
	assets.append(grass)
	assets.append(Log)
	assets.append(mushroom)
	assets.append(giantMushroom)
	assets.append(bush)
	assets.append(largeBush)
	assets.append(stones)
	assets.append(tree)
	shoreAssets.append(pier)
	particles.append(fireflies)
	particles.append(nightflies)
	waterAssets.append(seaWeed)
	waterAssets.append(lilyPad)
	# Materials
	materials.append(red)
	materials.append(green)
	materials.append(blue)
	
	nightAssets.append(nightElfGrass)
	nightAssets.append(nightElfPlant)
	nightAssets.append(nightElfTree)
	
	randomize()
	thread = Thread.new()
	
func _input(_event):
	#if Input.is_action_just_pressed("Start"):
		#$MoveTimer.start()
	if Input.is_action_just_pressed("Reset"):
		get_tree().change_scene("res://World.tscn")
		
func _process(delta):
	$WaterCast.rotate_y(2 * delta)
	$WaterDir.rotate_y(2 * delta)
	$MeshInstance.rotate_y(2 * delta)

#func _on_MoveTimer_timeout():
func _physics_process(delta):
	$WaterCast.global_transform.origin = $RayCast.get_collision_point()
	$WaterCast.global_transform.origin.y += 0.2
	$MeshInstance.global_transform.origin = $RayCast.get_collision_point()
	$MeshInstance.global_transform.origin.y += 0.2
	translation.x += 0.3
	if translation.x > 25:
		translation.z += 0.3
		translation.x = -25
	if translation.z > 25:
		set_physics_process(false)
	var genChoice = rand_range(0, 10)
	if biome == 1:
		if genChoice > 6:
			if $RayCast.is_colliding():
				if $WaterCast.is_colliding():
					if $WaterCast.get_collider().is_in_group("Water"):
						isShore = true
						print("SHORE")
				if $RayCast.get_collision_point().y < waterLevel:
					isWater = true
				if $RayCast.get_collider().is_in_group("Water"):
					choice = rand_range(0, 10)
					if choice > 9:
						var newLily = waterAssets[1].instance()
						newLily.set_as_toplevel(true)
						$RayCast.add_child(newLily)
						newLily.global_transform.origin = $RayCast.get_collision_point()
				if isShore:
					newAsset = shoreAssets[0].instance()
					newAsset.rotation.y = $WaterCast.rotation.y
				elif isWater:
					newAsset = waterAssets[0].instance()
					choice = rand_range(0, 1)
					if choice > 0.1:
						newAsset.visible = false
				else: #Standard
					choice = rand_range(0,8)
					if choice > 7.97: # Tree
						isTree = true
						var treeAsset = assets[10].instance()
						treeAsset.set_as_toplevel(true)
						$RayCast.add_child(treeAsset)
						treeAsset.global_transform.origin = $RayCast.get_collision_point()
					if choice > 7.99 && !isTree:
						isLog = true
						var stumpAsset = assets[4].instance()
						stumpAsset.set_as_toplevel(true)
						$RayCast.add_child(stumpAsset)
						stumpAsset.global_transform.origin = $RayCast.get_collision_point()
					else:
						choice = rand_range(0, 10)
						newAsset = assets[choice].instance() # Force log with correct material
						if newAsset.name == "GiantMushroom" || newAsset.name == "Bush":
							choice = rand_range(0, 10)
							newAsset = assets[choice].instance()
				choice = rand_range(0,10)
				if choice < 9.5 && !isWater && !isTree:
					# isGrass = true
					if newAsset.name != "Bush":
						newAsset.set_surface_material(0, materials[1])
					# newAsset.rotation.y = rand_range(0, 360)
				else:
					if !isWater:
						choice = rand_range(0, 3)
						newAsset.set_surface_material(0, materials[choice])
				newAsset.set_as_toplevel(true)
				$RayCast.add_child(newAsset) # Change to terrain?
				newAsset.global_transform.origin = $RayCast.get_collision_point()
				if !isShore || !isWater || !isBush:
					if newAsset.name != "SmallMushroom" || newAsset.name != "GiantMushroom" || newAsset.name != "LargeBush":
						newAsset.look_at($RayCast.get_collision_point() + $RayCast.get_collision_normal(), Vector3.UP)
				# If angle of object is too great, swap for appropiate asset
				if newAsset.rotation.x > 15 || newAsset.rotation.x < -15 || newAsset.rotation.z > 15 || newAsset.rotation.z < -15: # Fix! | Too steep
					pass
				# If next to water, generate appropiate asset
				# If above a certain height, generate appropiate asset
				if !isTree || isWater || isBush || newAsset.name != "LargeBush":
					choice = rand_range(0.4, 0.8)
					newAsset.scale = Vector3(choice,choice,choice)
				if newAsset.global_transform.origin.y > 6:
					pass
				newAsset.rotation.y = rand_range(0, 360)
				isShore = false
				isTree = false
				isWater = false
				isLog = false
				isGrass = false
#		if genChoice > 9.95 && $RayCast.get_collision_point().y > waterLevel:
#			var treeAsset = assets[6].instance()
#			treeAsset.set_as_toplevel(true)
#			$RayCast.add_child(treeAsset)
#			treeAsset.global_transform.origin = $RayCast.get_collision_point()
#			treeAsset.translation.y += 1.5
#			treeAsset.rotation.y = rand_range(0, 360)
		if genChoice > 9.95:
			newAsset = particles[0].instance()
			newAsset.set_as_toplevel(true)
			$RayCast.add_child(newAsset)
			newAsset.global_transform.origin = $RayCast.get_collision_point()
	else:
		if genChoice > 6:
			if $RayCast.is_colliding():
				if $WaterCast.is_colliding():
					if $WaterCast.get_collider().is_in_group("Water"):
						isShore = true
						print("SHORE")
				if $RayCast.get_collision_point().y < waterLevel:
					isWater = true
				if $RayCast.get_collider().is_in_group("Water"):
					choice = rand_range(0, 10)
					if choice > 9:
						var newLily = waterAssets[1].instance()
						newLily.set_as_toplevel(true)
						$RayCast.add_child(newLily)
						newLily.global_transform.origin = $RayCast.get_collision_point()
				if isShore:
					newAsset = shoreAssets[0].instance()
					newAsset.rotation.y = $WaterCast.rotation.y
#				elif isWater:
#					newAsset = waterAssets[0].instance()
#					choice = rand_range(0, 1)
#					if choice > 0.1:
#						newAsset.visible = false
				else: #Standard
					choice = rand_range(0,2)
					if choice > 1.95:
						isNightPlant = true
						newAsset = nightAssets[1].instance()
					else:
						newAsset = nightAssets[0].instance()
				newAsset.set_as_toplevel(true)
				$RayCast.add_child(newAsset) # Change to terrain?
				newAsset.global_transform.origin = $RayCast.get_collision_point()
				if !isNightPlant:
					newAsset.look_at($RayCast.get_collision_point() + $RayCast.get_collision_normal(), Vector3.UP)
				# If angle of object is too great, swap for appropiate asset
				if newAsset.rotation.x > 15 || newAsset.rotation.x < -15 || newAsset.rotation.z > 15 || newAsset.rotation.z < -15: # Fix! | Too steep
					pass
				# If next to water, generate appropiate asset
				# If above a certain height, generate appropiate asset
				if !isTree || isWater || isBush || newAsset.name != "LargeBush":
					choice = rand_range(0.4, 0.8)
					newAsset.scale = Vector3(choice,choice,choice)
				if newAsset.global_transform.origin.y > 6:
					pass
				newAsset.rotation.y = rand_range(0, 360)
				isNightPlant = false
		if genChoice > 9.95 && $RayCast.get_collision_point().y > waterLevel:
			var treeAsset = nightAssets[2].instance()
			treeAsset.set_as_toplevel(true)
			$RayCast.add_child(treeAsset)
			treeAsset.global_transform.origin = $RayCast.get_collision_point()
			treeAsset.rotation.y = rand_range(0, 360)
		if genChoice > 9.92:
			newAsset = particles[1].instance()
			newAsset.set_as_toplevel(true)
			$RayCast.add_child(newAsset)
			newAsset.global_transform.origin = $RayCast.get_collision_point()

func _on_Water_waterLevel(level):
	waterLevel = level

func _on_TerrainChunk_biome(ID):
	if ID > 1:
		biome = 0
	else:
		biome = 1
	print(biome)
