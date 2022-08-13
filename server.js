const app = require('fastify')({ logger: true });

const itemsRouter = require('./routes/itemsRoute');
app.register(itemsRouter);

app.listen({ port: 3000 }, (err, address) => {
  if (err) throw err;
  //   Server is now listening on ${address}
});
