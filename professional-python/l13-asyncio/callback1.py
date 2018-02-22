import asyncio
loop = asyncio.get_event_loop()

@asyncio.coroutine
def make_tea(variety):
	print('Now making %s tea.' % variety)
	return '%s tea' % variety

def comfirm_tea(future):
	print('The %s is make' % future.result())

task = asyncio.async(make_tea('green'))
task.add_done_callback(comfirm_tea)

loop.run_until_complete(task)
