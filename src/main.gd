extends Node2D

var foundSheets = []
var loadableSheets = []
var curSheet = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	dir_contents('res://assets/')
	print(foundSheets)
	for i in foundSheets:
		if i.ends_with("png"):
			loadableSheets.insert(0,i)
			$AssetsGuide.text += i + "\n"
	for i in loadableSheets:
			print("can be loaded: " + i + "\n")
	var image = Image.load_from_file("res://assets/Pico_FNF_assetss.png")
	var texture = ImageTexture.create_from_image(image)
	$LoadedAtlas.texture = texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		pass
		

func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				foundSheets.insert(0, file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
