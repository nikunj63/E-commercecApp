const CategoryModel = require('./../models/category_models');
const CategoryController = {

    createCategory:async function(req,res){

        try {
            const categoryData = req.body;
            const newCategory = new CategoryModel(categoryData);
            await newCategory.save();

            return res.json({sucess : true , data : newCategory, message: 'CategoryCreated!'});
            
        } catch (ex) {
            return res.json({sucess : false , message: ex});
        }
    },

    fetchAllCategories : async function(req,res){

        try {
            const categories = await CategoryModel.find();

            return res.json({sucess : true , data : categories});
            
        } catch (ex) {
            return res.json({sucess : false , message: ex});
        }
    }
};

module.exports = CategoryController;