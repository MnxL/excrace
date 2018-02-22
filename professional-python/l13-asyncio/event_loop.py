import asyncio

loop = asyncio.get_event_loop()
print(loop.is_running())

import functools

def hello_world():
	print('hello world')

def stop_loop(loop):
	print('Stop loop')
	loop.stop()

#loop.call_soon(hello_world)  # 注册hello_world函数
#loop.call_later(2, hello_world)  # 延迟调用
loop.call_soon(functools.partial(print, 'hello world')) # 与注册hello world等效

#loop.call_soon(functools.partial(stop_loop, loop))  # 偏函数，接收参数与关键字参数

loop.call_later(4, functools.partial(stop_loop, loop))

loop.run_forever()	# 循环开始，按顺序执行任务


