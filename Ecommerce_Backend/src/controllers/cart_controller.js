const CartModel = require('./../models/cart_model');

const CartController = {

    addToCart: async function (req , res) {
        try {
            const { product , user , quantity} = req.body;

            const foundCart = await CartModel.findOne({user:user});

            // If cart doesn't exist

            if (!foundCart) {
                const newCart = new CartModel({user : user});
                newCart.items.push({
                    product:product,
                    quantity:quantity,
                });

                await newCart.save();
                return res.json({sucess: true ,data: newCart,message: "Product added to Cart"});
            };

            // If cart alredy exists
            const updatedCart = await CartModel.findOneAndUpdate(
                {user: user},
                {$push: {items: {product: product , quantity: quantity}}},
                {new: true}
            );
            return res.json({sucess: true ,data: updatedCart,message: "Product added to Cart"});

        } catch (ex) {
            return res.json({sucess: false ,message:ex});
        }
    },

    removeFromCart: async function(req ,res){

    }
};
module.exports = CartController;