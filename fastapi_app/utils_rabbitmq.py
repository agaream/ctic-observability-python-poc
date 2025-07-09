import os
import aio_pika
import asyncio

RABBITMQ_URL = os.getenv("RABBITMQ_URL", "amqp://guest:guest@localhost/")  # fallback for local dev

async def get_connection():
    return await aio_pika.connect_robust(RABBITMQ_URL)

async def send_message(queue_name: str, message: str):
    connection = await get_connection()
    async with connection:
        channel = await connection.channel()
        queue = await channel.declare_queue(queue_name, durable=True)
        await channel.default_exchange.publish(
            aio_pika.Message(body=message.encode()),
            routing_key=queue.name
        )

async def consume_message(queue_name: str) -> str:
    connection = await get_connection()
    async with connection:
        channel = await connection.channel()
        queue = await channel.declare_queue(queue_name, durable=True)
        incoming = await queue.get(no_ack=True)
        return incoming.body.decode() if incoming else "No message in queue"