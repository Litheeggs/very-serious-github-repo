extends SpineSprite

class_name JumpScareController

const TRACK_ID: int = 0

enum JumpscareControllerState{ HIDDEN, JUMP }

@export var range_scream_db: Vector2 = Vector2(-10.0, 20.0)
@onready var voice: AudioStreamPlayer2D = $Voice # jumpscare has only 1 voice output
@onready var anime_state: SpineAnimationState = get_animation_state()

var _state = JumpscareControllerState.HIDDEN

func _process(delta: float) -> void:
	if _state == JumpscareControllerState.HIDDEN: return
	
	# check if track of jumpscare is completed -> then turn off
	var track: SpineTrackEntry = anime_state.get_track(TRACK_ID)
	if track.is_complete(): stop_jumpscare()
	
func start_jumpscare() -> void:
	anime_state.clear_tracks()
	
	var jump: RangeTrack = JumpscareAnimationConfig.JUMP
	var speed: float = randf_range(jump.min_speed(), jump.max_speed())
	anime_state.set_animation(jump.track(), jump.loop(), TRACK_ID).set_time_scale(speed)
	
	_init_voice()
	
	visible = true
	_state = JumpscareControllerState.JUMP
	
func _init_voice() -> void:
	voice.volume_db = randf_range(range_scream_db.x, range_scream_db.y)
	voice.play(0.0) # start at 0
	
func stop_jumpscare() -> void:
	visible = false
	_state = JumpscareControllerState.HIDDEN
