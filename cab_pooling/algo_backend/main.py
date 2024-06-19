import asyncio
import time
import task


async def main():
    while True:
        print("Running Algorithm...")
        await task.make_pool()
        await asyncio.sleep(5)

# Run the event loop
asyncio.run(main())
