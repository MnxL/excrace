import asyncio
import functools

loop = asyncio.get_event_loop()

@asyncio.coroutine
def make_tea(variety):
	print('now makeing %s tea' % variety)
	return '%s tea' % variety

def add_ingredient(ingredient, future):
	print('Now adding %s to the %s.' % (ingredient, future.result()))

task = asyncio.async(make_tea('herbal'))
task.add_done_callback(functools.partial(add_ingredient, 'honey'))

loop.run_until_complete(task)
