class_name BatState extends State


const MOVE := 'Move'
const ATTACK := 'Attack'
const DEAD := 'Dead'
const HURT := 'Hurt'


var bat : Bat

func _ready() -> void:
	await owner.ready
	bat = owner as Bat
	assert(bat != null, "The BatState state type must be used only in the bat scene. It needs the owner to be a bat node.")
