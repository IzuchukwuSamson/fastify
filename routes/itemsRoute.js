const itemsController = require('../controllers/itemsController');

const Items = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    name: { type: 'string' },
  },
};

schemaOpt = {
  response: {
    200: Items,
  },
};

const getItemsOpts = {
  schema: {
    response: {
      200: {
        type: 'array',
        items: Items,
      },
    },
  },
  handler: itemsController.getAllItems,
};

const getItemOpts = {
  schema: schemaOpt,
  handler: itemsController.getOneItem,
};

const postItemOpts = {
  body: {
    type: 'Object',
    required: ['name'],
    properties: {
      name: {
        type: 'string',
      },
    },
  },
  schema: {
    response: {
      201: Items,
    },
  },
  handler: itemsController.postItem,
};

const updateItemOpts = {
  schema: schemaOpt,
  handler: itemsController.updateItem,
};

const deleteItemOpts = {
  schema: {
    response: {
      200: {
        type: 'object',
        properties: {
          message: { type: 'string' },
        },
      },
    },
  },
  handler: itemsController.deleteItem,
};

function router(app, options, done) {
  // Get all items
  app.get('/items', getItemsOpts);

  // Get single item
  app.get('/items/:id', getItemOpts);

  // Add Item
  app.post('/items', postItemOpts);

  // Update Item
  app.put('/items/:id', updateItemOpts);

  // Delete Item
  app.delete('/items/:id', deleteItemOpts);

  done();
}

// done();

module.exports = router;
