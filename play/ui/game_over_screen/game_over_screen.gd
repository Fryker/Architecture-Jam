class_name GameOverScreen extends UI


@export var score_label : Label
@export var anim : AnimationPlayer
@export var background : ColorRect


func  _ready() -> void:
	hide()
	background.color = Color(00000046)


func game_over(score : int) -> void:
	get_tree().paused = true
	anim.play('Appear')
	score_label.text = 'Total Score: %s' % score


func _on_change_scene_button_pressed() -> void:
	get_tree().paused = false
	anim.play('Dissapear')
