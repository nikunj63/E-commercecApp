const ProductModel = require("../models/product_models");

const ProductController = {
    createProduct: async function (req,res) {
        try {
            const productData = req.body;
            const  newProduct = new ProductModel(productData);
            await newProduct.save();

            return res.json({sucess: true , data: newProduct, message:'Product created!'});

        } catch (ex) {
            return res.json({sucess:false , message: ex});
        }
    },
    fetchAllProducts: async function (req , res) {

        try {
            const products = await ProductModel.find();
            return res.json({sucess: true , data: products});

        } catch (ex) {
            return res.json({sucess:false , message: ex});
        }
    }
};

module.exports = ProductController;