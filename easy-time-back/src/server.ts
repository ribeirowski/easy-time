import fastify from 'fastify'
import { env } from './env'

const app = fastify({ logger: true })

app.get('/', async (request, reply) => ({
  message: 'EasyTime backend is running...',
}))

const start = async () => {
  try {
    await app.listen({
      host: '0.0.0.0',
      port: env.PORT,
    })
    const address = app.server.address()
    const host = typeof address === 'string' ? address : address?.address
    const port = typeof address === 'string' ? address : address?.port

    console.log(`🚀 Server listening at http://${host}:${port}`)
  } catch (err) {
    app.log.error(err)
    process.exit(1)
  }
}

start()
