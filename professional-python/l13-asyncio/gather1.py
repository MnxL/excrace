import asyncio
loop = asyncio.get_event_loop()

@asyncio.coroutine
def make_tea(var):
	print('now making %s tea' % var)
	return '%s tea' % var

def mix(future):
	print('Mixing the %s together.' % ' and '.join(future.result()))
	
meta_task = asyncio.gather(make_tea('herbal'), make_tea('green'))
meta_task.add_done_callback(mix)

loop.run_until_complete(meta_task)
