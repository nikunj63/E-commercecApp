const {Schema, model} = require('mongoose');

const  cartItemSchema = new Schema({
    product: {type:Schema.type.objectId , ref: 'Product'},
    quantity: {type: Number,default:1},
});

const cartSchema = new Schema({
    user: {type:Schema.type.objectId , ref:'User' , required: true},
    items:{type: [cartItemSchema], default : [] },
    updatedOn: {type: Date},
    createdOn: {type: Date},

});
cartSchema.pre('save' ,function(next){
    this.updatedOn = new Date();
    this.createdOn = new Date();


    next();
});

cartSchema.pre(['update' , 'findOneAndUpdate','updateOne'], function(next){
    const update = this.getUpdate();
    delete update._id;

    this.updateedOn = new Date();

    next();
});

const CartModel = model('Category', cartSchema);

module.exports =  CartModel;