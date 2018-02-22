import asyncio

@asyncio.coroutine
def coro_sum(*args):
	answer = 0
	for i in args:
		answer += i
	print(answer)
	return answer

loop = asyncio.get_event_loop()
loop.run_until_complete(coro_sum(1,2,3,4,5))
