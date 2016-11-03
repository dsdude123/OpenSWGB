extends VideoPlayer

var lastvideoplaying = false

func _ready():
	var logovideo = load("res://graphics/video/xlogo1.ogv")
	set_stream(logovideo)
	self.play()
	
	#Wait before playing next video
	var t = Timer.new()
	t.set_wait_time(14)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	gotointro()


func gotointro():
	lastvideoplaying = self.is_playing()
	if lastvideoplaying == false:
		var introvideo = load("res://graphics/video/xintro.ogv")
		set_stream(introvideo)
		self.play()
		#Wait before playing next video
		var t = Timer.new()
		t.set_wait_time(70)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		nextScene()
		
	else:
		gotointro()
#	
func nextScene():
	get_node("/root/sceneController").setScene("res://scene/MainMenu.xml")