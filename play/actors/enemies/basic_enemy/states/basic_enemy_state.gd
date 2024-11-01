class_name BasicEnemyState extends State


const MOVE := 'Move'
const ATTACK := 'Attack'
const DEAD := 'Dead'
const HURT := 'Hurt'


var basic_enemy : BasicEnemy

func _ready() -> void:
	await owner.ready
	basic_enemy = owner as BasicEnemy
	assert(basic_enemy != null, "The BasicEnemyState state type must be used only in the basic_enemy scene. It needs the owner to be a BasicEnemy node.")
