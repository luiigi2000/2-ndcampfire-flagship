extends RayCast3D

@onready var water_particles = $"../WaterParticles"
var putout_debounce := true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_collider() != null:
		if water_particles.emitting and get_collider().name == "Fire" and putout_debounce:
			putout_debounce = false
			$Debounce_Timer.start()
			if get_collider().get_node("Fire_Particles").amount > 1:
				get_collider().get_node("Fire_Particles").amount -= 1
			else:
				get_collider().queue_free()


func _on_debounce_timer_timeout() -> void:
	putout_debounce = true
