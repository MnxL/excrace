import asyncio

queue = asyncio.Queue()
queue.put_nowait('foo')
print(queue.qsize())
print(queue.get_nowait())
print(queue.qsize())



loop = asyncio.get_event_loop()
queue.put_nowait('aaa')
print(loop.run_until_complete(queue.get())) # get方法耐心等待项被添加到队列中
