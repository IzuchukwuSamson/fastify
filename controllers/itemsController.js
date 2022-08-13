const Item = require('../models/itemsModel');
const { v4: uuidv4 } = require('uuid');
let items = require('../models/itemsModel');

exports.getAllItems = (req, res) => {
  res.send(Item);
};

exports.getOneItem = (req, res) => {
  const { id } = req.params;
  const item = Item.find((item) => item.id === id);
  res.send(item);
};

exports.postItem = (req, res) => {
  const { name } = req.body;
  const item = {
    id: uuidv4(),
    name,
  };

  items = [...items, item];
  res.code(201).send(item);
};

exports.updateItem = (req, res) => {
  const { id } = req.params;
  const { name } = req.body;

  items = items.map((item) => (item.id === id ? { id, name } : item));

  item = items.find((item) => item.id === id);

  res.send(item);
};

exports.deleteItem = (req, res) => {
  const { id } = req.params;
  items = items.filter((item) => item.id !== id);
  res.send({ message: `Item ${id} has been removed` });
};
