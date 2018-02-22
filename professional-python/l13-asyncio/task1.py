import asyncio

@asyncio.coroutine
def make_tea(variety):
	print('Now making %s tea' % variety)
	asyncio.get_event_loop().stop()
	return '%s tea' % variety

task = asyncio.async(make_tea('chamomile'))

print(task.done())
#print(task.result())

loop = asyncio.get_event_loop()
loop.run_forever()

print(task.done())
print(task.result())
