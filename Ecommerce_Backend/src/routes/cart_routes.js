const CartRoutes = require('express').Router();
const CartController = require('./../controllers/cart_controller');

CartRoutes.post("/", CartController.addToCart);

module.exports = CartRoutes;
