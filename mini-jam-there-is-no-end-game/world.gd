extends Node2D


var maxStars = 0

func addStar():
	maxStars+=1

func _process(delta: float) -> void:
	$CanvasLayer/starRatio.text = str($player/CharacterBody2D.stars) + "/" + str(maxStars)
