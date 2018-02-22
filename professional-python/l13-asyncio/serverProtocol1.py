import asyncio

class Shutdown(Exception):
	pass

class ServerProtocol(asyncio.Protocol):
	def connection_made(self, transport):
		self.transport = transport
		self.write('Welcome.')

	def data_received(self, data):
		# Sanity check: Do nothing on empty commands.
		if not data:
			return

		# Commands to this server shall be a single word, with
		# space separated arguments.
		message = data.decode('ascii')
		command = message.strip().split(' ')[0].lower()
		args = message.strip().split(' ')[1:]

		# Sanity check: Verify the presence of the appropriate command.
		if not hasattr(self, 'command_%s' % command):
			self.write('Invalid command: %s' % command)
			return

		# Run the appropriate command.
		try:
			return getattr(self, 'command_%s' % command)(*args)
		except Exception as ex:
			self.write('Errot: %s\n' % str(ex))

	def write(self, msg_string):
		msg_string += '\n'
		self.transport.write(msg_string.encode('ascii', 'ignore'))

	def command_add(self, *args):
		args = [int(i) for i in args]
		self.write('%d' % sum(args))
	
	def command_shutdown(self):
		self.write('Okay. Shutting down.')
		raise KeyboardInterrupt

if __name__ == '__main__':
	loop = asyncio.get_event_loop()
	coro = loop.create_server(ServerProtocol, '127.0.0.1', 8000)
	asyncio.async(coro)
	try:
		loop.run_forever()
	except KeyboardInterrupt:
		pass
