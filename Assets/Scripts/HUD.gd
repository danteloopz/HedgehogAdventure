extends CanvasLayer

var coins = 0
var key = false

func _ready():
	$Coins/CoinsAmmount.text = String(SaveSystem.data.coins)


func _on_coin_collected():
	SaveSystem.add_coin()
	coins = coins + 1
	_ready()
	
func _on_key_collected():
	key = true
	$Key/AnimationPlayer.play("Collected")
	
