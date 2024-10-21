const UserRoutes = require('express').Router();
const UserController = require('./../controllers/user_controller')

UserRoutes.post("/createAccount",UserController.createAccount );

module.exports = UserRoutes; 