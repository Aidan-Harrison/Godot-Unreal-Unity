extends DirectionalLight

var yellow = Color(239,236,162)
var purple = Color(163,85,206)
var colours = []

func _ready():
	randomize()
	rotation.x = rand_range(0, 180)
	rotation.y = rand_range(0, 180)
	#rotation.z = rand_range(0, 180)
	
