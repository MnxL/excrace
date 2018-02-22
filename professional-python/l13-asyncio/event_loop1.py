import asyncio

@asyncio.coroutine
def trivial():
	print( 'Hello World')

loop = asyncio.get_event_loop()

loop.run_until_complete(trivial())

