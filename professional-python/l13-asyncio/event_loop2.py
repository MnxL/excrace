import asyncio
import threading

def run_loop_forever_in_background(loop):
	def thread_func(l):
		asyncio.set_event_loop(l)
		l.run_forever()
	thread = threading.Thread(target=thread_func, args=(loop,))
	thread.start()
	return thread

loop = asyncio.get_event_loop()
run_loop_forever_in_background(loop)
print(loop.is_running())
