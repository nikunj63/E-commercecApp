const OrderModel = require('./../models/order_model');
const CartModel = require('./../models/cart_model');

const OrderController = {

    createOrder: async function( req, res){
        try {

            const {user , items , status}= req.body;
            const newOrder = new OrderModel({
                user : user,
                items : items,
                status: status
            });
            await newOrder.save();

            // update the cart
            await CartModel.findOneAndUpdate(
              {user: user._id},
              { items:[]}
            );

            return res.json({sucess: true , data: newOrder , message: "Order Created!"})

        } catch (ex) {
            return res.json({sucess: false ,message:ex});
        }
    },

    fetchOrdersForUser: async function (req , res) {
        try {
            const userId = req.params.userId;
            const foundOrders = await OrderModel.find({
                "user._id": userId,

            }).sort({createdOn: -1});

            return res.json({sucess: true ,data: foundOrders});

        } catch (ex) {
            return res.json({sucess: false ,message:ex});
        }
    },
    updateOrderStatus: async function (req, res) {
        try {
            const { orderId , status} = req.body;
            const updatedOrder = await OrderModel.findOneAndUpdate(
                {_id: orderId},
                {status: status},
                {new: true},

            );

            return res.json({sucess: true ,data: updatedOrder});

        } catch (ex) {
            return res.json({sucess: false ,message:ex});
        }
    }
};
module.exports = OrderController;