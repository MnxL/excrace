import asyncio

@asyncio.coroutine
def nested(*args):
	print('The `nested` function ran with args: %r' %(args,))
	print('nested func: ', [i + 1 for i in args])
	return [i + 1 for i in args]

@asyncio.coroutine
def outer(*args):
	print('The `outer` function ran with args: %r' % (args,))
	answer = yield from nested(*[i*2 for i in args])
	print('outer func: ', answer)
	return answer

loop = asyncio.get_event_loop()
loop.run_until_complete(outer(2, 3, 5, 8))
