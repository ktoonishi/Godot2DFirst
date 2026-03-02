extends Area2D

@export var speed = 400

func _process(delta):
	# 弾は勝手に下に落ちていく
	position.y += speed * delta
	
	# 画面の下（例えば700px）を超えたら消える
	if position.y > 700:
		queue_free()
