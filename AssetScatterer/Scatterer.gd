extends Spatial

# Other
var waterLevel = 0

onready var caster = $RayCast
var parent

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
onready var flower = preload("res://Assets/GeneralAssets/Flower.tscn")

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

var isMegaNode = false

var newAsset
var choice = 0

var hasTree = true
var hasGrass = true

var multiMeshCounter : int = 0
var treeCounter : int = 0
var grassCounter : int = 0

var biome : int = 0

var thread

var generator = RandomNumberGenerator.new()

# Mega assets
# Node - to - Node connections
# Camera/Player bounds optimisations
# poly optimisation

#func Setup():
func _ready(): # Add biome gen function instead
	randomize()
	if isMegaNode:
		pass
	else:
		set_physics_process(false)
		parent = get_parent()
		assets.append(asset1)
		assets.append(asset2)
		assets.append(asset3)
		assets.append(Log)
		assets.append(grass)
		assets.append(mushroom)
		assets.append(giantMushroom)
		assets.append(bush)
		assets.append(largeBush)
		assets.append(flower)
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
		
		#caster.translation.x = -parent.chunkDimensions / 2
		#caster.translation.z = -parent.chunkDimensions / 2
		
		#$MoveTimer.start()
	
func _input(_event):
	if Input.is_action_just_pressed("Start"):
		$MoveTimer.start()
	if Input.is_action_just_pressed("Reset"):
		get_tree().change_scene("res://World.tscn")
	multiMeshCounter = 0
		
#func _process(delta):
	#$WaterCast.rotate_y(2 * delta)
	#$WaterDir.rotate_y(2 * delta)
	#$MeshInstance.rotate_y(2 * delta)

# func _physics_process(delta):
#func TEMPFUNC():
#	$WaterCast.global_transform.origin = $RayCast.get_collision_point()
#	$WaterCast.global_transform.origin.y += 0.2
#	$MeshInstance.global_transform.origin = $RayCast.get_collision_point()
#	$MeshInstance.global_transform.origin.y += 0.2
#	$RayCast.translation.x += 1.5
#	if $RayCast.translation.x > 25:
#		$RayCast.translation.z += 1.5
#		$RayCast.translation.x = -25
#	if $RayCast.translation.z > 25:
#		$MoveTimer.stop()
#	var genChoice = rand_range(0, 10)
#	if biome == 1:
#		if genChoice > 6:
#			if $RayCast.is_colliding():
#				if $WaterCast.is_colliding():
#					if $WaterCast.get_collider().is_in_group("Water"):
#						isShore = true
#						print("SHORE")
#				if $RayCast.get_collision_point().y < waterLevel:
#					isWater = true
#				if $RayCast.get_collider().is_in_group("Water"):
#					choice = rand_range(0, 10)
#					if choice > 9:
#						var newLily = waterAssets[1].instance()
#						newLily.set_as_toplevel(true)
#						$RayCast.add_child(newLily)
#						newLily.global_transform.origin = $RayCast.get_collision_point()
#				if isShore:
#					newAsset = shoreAssets[0].instance()
#					newAsset.rotation.y = $WaterCast.rotation.y
#				elif isWater:
#					newAsset = waterAssets[0].instance()
#					choice = rand_range(0, 1)
#					if choice > 0.1:
#						newAsset.visible = false
#				else: #Standard
#					choice = rand_range(0,8)
#					if choice > 7.97: # Tree
#						isTree = true
#						var treeAsset = assets[10].instance()
#						treeAsset.set_as_toplevel(true)
#						$RayCast.add_child(treeAsset)
#						treeAsset.global_transform.origin = $RayCast.get_collision_point()
#					if choice > 7.99 && !isTree:
#						isLog = true
#						var stumpAsset = assets[4].instance()
#						stumpAsset.set_as_toplevel(true)
#						$RayCast.add_child(stumpAsset)
#						stumpAsset.global_transform.origin = $RayCast.get_collision_point()
#					else:
#						choice = rand_range(0, 10)
#						newAsset = assets[choice].instance() # Force log with correct material
#						if newAsset.name == "GiantMushroom" || newAsset.name == "Bush":
#							choice = rand_range(0, 10)
#							newAsset = assets[choice].instance()
#				choice = rand_range(0,10)
#				if choice < 9.5 && !isWater && !isTree:
#					# isGrass = true
#					if newAsset.name != "Bush":
#						newAsset.set_surface_material(0, materials[1])
#					# newAsset.rotation.y = rand_range(0, 360)
#				else:
#					if !isWater:
#						choice = rand_range(0, 3)
#						newAsset.set_surface_material(0, materials[choice])
#				newAsset.set_as_toplevel(true)
#				$RayCast.add_child(newAsset) # Change to terrain?
#				newAsset.global_transform.origin = $RayCast.get_collision_point()
#				#$TreeMultiMesh.multimesh.set_instance_transform(multiMeshCounter, Transform(Basis(), $RayCast.get_collision_point()))
#				$GrassMultiMesh.multimesh.set_instance_transform(multiMeshCounter, Transform(Basis(), $RayCast.get_collision_point()))
#				multiMeshCounter += 1
#				if multiMeshCounter >= 500:
#					$MoveTimer.stop()
#				if !isShore || !isWater || !isBush:
#					pass
#					#if newAsset.name != "SmallMushroom" || newAsset.name != "GiantMushroom" || newAsset.name != "LargeBush":
#						#newAsset.look_at($RayCast.get_collision_point() + $RayCast.get_collision_normal(), Vector3.UP)
#				# If angle of object is too great, swap for appropiate asset
#				if newAsset.rotation.x > 15 || newAsset.rotation.x < -15 || newAsset.rotation.z > 15 || newAsset.rotation.z < -15: # Fix! | Too steep
#					pass
#				# If next to water, generate appropiate asset
#				# If above a certain height, generate appropiate asset
#				if !isTree || isWater || isBush || newAsset.name != "LargeBush":
#					choice = rand_range(0.4, 0.8)
#					newAsset.scale = Vector3(choice,choice,choice)
#				#if newAsset.global_transform.origin.y > 6:
#					#pass
#				newAsset.rotation.y = rand_range(0, 360)
#				isShore = false
#				isTree = false
#				isWater = false
#				isLog = false
#				isGrass = false
##		if genChoice > 9.95 && $RayCast.get_collision_point().y > waterLevel:
##			var treeAsset = assets[6].instance()
##			treeAsset.set_as_toplevel(true)
##			$RayCast.add_child(treeAsset)
##			treeAsset.global_transform.origin = $RayCast.get_collision_point()
##			treeAsset.translation.y += 1.5
##			treeAsset.rotation.y = rand_range(0, 360)
#		if genChoice > 9.95:
#			newAsset = particles[0].instance()
#			newAsset.set_as_toplevel(true)
#			$RayCast.add_child(newAsset)
#			newAsset.global_transform.origin = $RayCast.get_collision_point()
#	else:
#		if genChoice > 6:
#			if $RayCast.is_colliding():
#				if $WaterCast.is_colliding():
#					if $WaterCast.get_collider().is_in_group("Water"):
#						isShore = true
#						print("SHORE")
#				if $RayCast.get_collision_point().y < waterLevel:
#					isWater = true
#				if $RayCast.get_collider().is_in_group("Water"):
#					choice = rand_range(0, 10)
#					if choice > 9:
#						var newLily = waterAssets[1].instance()
#						newLily.set_as_toplevel(true)
#						$RayCast.add_child(newLily)
#						newLily.global_transform.origin = $RayCast.get_collision_point()
#				if isShore:
#					newAsset = shoreAssets[0].instance()
#					newAsset.rotation.y = $WaterCast.rotation.y
##				elif isWater:
##					newAsset = waterAssets[0].instance()
##					choice = rand_range(0, 1)
##					if choice > 0.1:
##						newAsset.visible = false
#				else: #Standard
#					choice = rand_range(0,2)
#					if choice > 1.95:
#						isNightPlant = true
#						newAsset = nightAssets[1].instance()
#					else:
#						newAsset = nightAssets[0].instance()
#				newAsset.set_as_toplevel(true)
#				$RayCast.add_child(newAsset) # Change to terrain?
#				newAsset.global_transform.origin = $RayCast.get_collision_point()
#				if !isNightPlant:
#					newAsset.look_at($RayCast.get_collision_point() + $RayCast.get_collision_normal(), Vector3.UP)
#				# If angle of object is too great, swap for appropiate asset
#				if newAsset.rotation.x > 15 || newAsset.rotation.x < -15 || newAsset.rotation.z > 15 || newAsset.rotation.z < -15: # Fix! | Too steep
#					pass
#				# If next to water, generate appropiate asset
#				# If above a certain height, generate appropiate asset
#				if !isTree || isWater || isBush || newAsset.name != "LargeBush":
#					choice = rand_range(0.4, 0.8)
#					newAsset.scale = Vector3(choice,choice,choice)
#				if newAsset.global_transform.origin.y > 6:
#					pass
#				newAsset.rotation.y = rand_range(0, 360)
#				isNightPlant = false
#		if genChoice > 9.95 && $RayCast.get_collision_point().y > waterLevel:
#			var treeAsset = nightAssets[2].instance()
#			treeAsset.set_as_toplevel(true)
#			$RayCast.add_child(treeAsset)
#			treeAsset.global_transform.origin = $RayCast.get_collision_point()
#			treeAsset.rotation.y = rand_range(0, 360)
#		if genChoice > 9.92:
#			newAsset = particles[1].instance()
#			newAsset.set_as_toplevel(true)
#			$RayCast.add_child(newAsset)
#			newAsset.global_transform.origin = $RayCast.get_collision_point()
			
#func TEMPFUNC():
#func _physics_process(delta):
func _on_MoveTimer_timeout():
	$RayCast.translation.x += 1.35
	if $RayCast.translation.x > 125:
		$RayCast.translation.z += 1.35
		$RayCast.translation.x = -25
	if $RayCast.translation.z > 125:
		#$MoveTimer.stop()
		set_physics_process(false)
		#Move()
	var choice = rand_range(0, 1)
	if choice > 0.375 && $RayCast.get_collision_point().y > waterLevel:
		var transform = Transform()
		transform = transform.rotated(Vector3.UP,rand_range(0, 360))
		transform.origin = $RayCast.get_collision_point()
		choice = rand_range(0, 1)
		if choice > 0.98 && hasTree:
			$TreeMultiMesh.multimesh.set_instance_transform(treeCounter, transform)
			treeCounter += 1
		elif choice < 0.98 && hasGrass:
			$GrassMultiMesh.multimesh.set_instance_transform(grassCounter, transform)
			grassCounter += 1
		if treeCounter >= $TreeMultiMesh.multimesh.get_instance_count():
			hasTree = false
		if grassCounter >= $GrassMultiMesh.multimesh.get_instance_count():
			hasGrass = false
	if choice > 0.9 && $RayCast.get_collision_point().y > waterLevel: # Standard asset generation
		choice = generator.randi_range(5, 9)
		var newAsset = assets[choice].instance()
		newAsset.set_as_toplevel(true)
		add_child(newAsset)
		newAsset.global_transform.origin = $RayCast.get_collision_point()
		newAsset.rotation.y = rand_range(0, 360)
	if choice > 0.995 && $RayCast.get_collision_point().y > waterLevel:
		newAsset = particles[1].instance()
		newAsset.set_as_toplevel(true)
		$RayCast.add_child(newAsset)
		newAsset.global_transform.origin = $RayCast.get_collision_point()

func Move(): # Make universal!
	# X Pos
	if parent.xPos == 0:
		self.translation.x -= 50
	if parent.xPos == 50:
		self.translation.x -= 100
	if parent.xPos == 100:
		self.translation.x -= 150
	# Z Pos
	if parent.zPos == 50:
		self.translation.z -= 50
	if parent.zPos == 100:
		self.translation.z -= 100

func _on_Water_waterLevel(level):
	waterLevel = level

#func _on_TerrainChunk_biome(ID):
#	if ID > 1:
#		biome = 0
#	else:
#		biome = 1
