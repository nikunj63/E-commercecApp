const CartModel = require('./../models/cart_model')

const CartController = {

    addToCart: async function (req , res) {
        try {
            const{product , user , quantity} = req.body;

            const foundCart = await CartModel.findOne({user:user});

            if (!foundCart) {
                const newCart = new CartModel({user : user});
                newCart.items.push({
                    product:product,
                    quantity:quantity,
                });

                await newCart.save();
                return res.json({sucess: true ,data: newCart,message: "Product added to Cart"});
            }
        } catch (ex) {
            
        }
    },

    removeFromCart: async function(req ,res){

    }
};
module.exports = CartController;