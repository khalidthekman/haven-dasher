extends Node2D

var coins := 0

@onready var counter_label: Label = $CanvasLayer/CoinCounter

func _ready() -> void:
	get_tree().node_added.connect(_on_node_added)

func _on_node_added(node: Node) -> void:
	if node is Area2D and node.has_signal("collected"):
		node.collected.connect(_on_coin_collected)

func _on_coin_collected() -> void:
	coins += 1
	counter_label.text = "Coins: %d" % coins
