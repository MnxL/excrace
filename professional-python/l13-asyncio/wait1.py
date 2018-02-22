import asyncio
loop = asyncio.get_event_loop()

#coro = asyncio.wait([asyncio.sleep(5), asyncio.sleep(1)], timeout=3)
coro = asyncio.wait([asyncio.sleep(5),asyncio.sleep(1), asyncio.sleep(1)], return_when=asyncio.FIRST_COMPLETED)
print(loop.run_until_complete(coro))
