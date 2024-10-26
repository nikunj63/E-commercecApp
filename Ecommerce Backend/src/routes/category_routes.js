const CategoryRoutes = require('express').Router();
const CategoryController = require('./../controllers/category_controller')

CategoryRoutes.get("/",CategoryController.fetchAllCategories );
CategoryRoutes.post("/",CategoryController.createCategory);

module.exports = CategoryRoutes; 