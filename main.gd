extends Node2D
@export var bullet_scene: PackedScene

var score = 100 # 初期スコア

func _ready():
	# 画面のサイズ（幅と高さ）を Vector2 型で取得
	var scr_size = get_viewport_rect().size
	$Player.position = Vector2(scr_size.x / 2, scr_size.y - 70)
	
	# ゲーム開始時に画面の文字を更新
	update_score_label()

# スコア表示を書き換える専用の関数（命令）
func update_score_label():
	# CanvasLayerの中にあるLabelを探して文字を変える
	$CanvasLayer/ScoreLabel.text = "Score: " + str(score) + " Speed: " + str(300 + (score * 3))
	

func _on_score_timer_timeout():
	score += 10            # スコアを1増やす
	update_score_label()   # ラベルの表示を更新する（前作った関数）


func _on_spawn_timer_timeout():
	var b = bullet_scene.instantiate()
	var current_speed = 300 + (score * 3)
	b.speed = current_speed
	b.position = Vector2(randf_range(0, 1100), -50)
	
	add_child(b)
