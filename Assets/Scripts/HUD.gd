extends CanvasLayer

var coins = SaveSystem.data.coins
var key = false

func _ready():
	$Coins/CoinsAmmount.text = String(coins)

func _on_coin_collected():
	coins = coins + 1
	_ready()

func _on_key_collected():
	key = true
	$Key/AnimationPlayer.play("Collected")
	
func _on_Spawnpoint_save_coins():
	SaveSystem.Save_progress(coins)
