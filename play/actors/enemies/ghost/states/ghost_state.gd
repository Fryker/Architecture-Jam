class_name GhostState extends State


const MOVE := 'Move'
const ATTACK := 'Attack'
const DEAD := 'Dead'
const HURT := 'Hurt'


var ghost : Ghost

func _ready() -> void:
	await owner.ready
	ghost = owner as Ghost
	assert(ghost != null, "The GhostState state type must be used only in the ghost scene. It needs the owner to be a Ghost node.")
