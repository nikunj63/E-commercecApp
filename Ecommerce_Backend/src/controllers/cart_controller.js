const CartModel = require('./../models/cart_model');

const CartController = {

    getCartForUser: async function( req, res){
        try {
            const user = req.params.user;
            const foundCart = await CartModel.findOne({user : user}).populate("items.product");

            if(!foundCart){
                return res.json({ sucess: true , data:[]});
            };
            return res.json({ sucess: true , data:foundCart.items});


        } catch (ex) {
            return res.json({sucess: false ,message:ex});
        }
    },


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

            // Deleting the item if already exists
           const deletedItem =  await CartModel.findOneAndUpdate(
                {user:user,"items.product":product},
                {$pull:{items:{product:product}}},
                {new:true}
            ) 

            // If cart alredy exists
            const updatedCart = await CartModel.findOneAndUpdate(
                {user: user},
                {$push: {items: {product: product , quantity: quantity}}},
                {new: true}
            ).populate("items.product");
            return res.json({sucess: true ,data: updatedCart.items,message: "Product added to Cart"});

        } catch (ex) {
            return res.json({sucess: false ,message:ex});
        }
    },

    removeFromCart: async function(req ,res){
        try {
            const {user , product } = req.body;
            const updatedCart = await CartModel.findOneAndUpdate(
                {user : user},
                {$pull : {items : {product : product}}},
                {new : true},
            ).populate("items.product");

            return res.json({sucess: true ,data: updatedCart.items,message: "Product removed from Cart"});


        } catch (ex) {
            return res.json({sucess: false ,message:ex});
        }
    }
};
module.exports = CartController;