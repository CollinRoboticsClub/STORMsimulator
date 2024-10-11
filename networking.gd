extends Node

var socket = WebSocketPeer.new()
var TCP = TCPServer.new()
func _ready():
	TCP.listen(8080)
	#await TCP.is_connection_available() == true
	await TCP.take_connection()
	print("connected")

func _process(delta):
	if TCP.is_connection_available():
		print("Connection availible!")
	else:
		print("Connection unavailible!")


func websocket():
	socket.poll()
	var state = socket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			print("Packet: ", socket.get_packet())
	elif state == WebSocketPeer.STATE_CLOSING:
		# Keep polling to achieve proper close.
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = socket.get_close_code()
		var reason = socket.get_close_reason()
		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		set_process(false) # Stop processing.
	
	
	var imageasbytearray = get_viewport().get_texture().get_image().data["data"]
	socket.send(imageasbytearray)
