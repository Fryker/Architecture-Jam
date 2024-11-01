class_name PlayerState extends State


const IDLE := 'Idle'
const MOVE := 'Move'
const DEAD := 'Dead'
const HURT := 'Hurt'

const NONE := 'None'
const  ATTACK:= 'Attack'

var player : Player


func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
