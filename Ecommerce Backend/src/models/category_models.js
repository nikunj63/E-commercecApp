const {Schema, model} = require('mongoose');

const categorySchema = new Schema({
    title:{ type: String, required:[true,'']},
    description:{type: String , default:""},
    updatedOn:{type:date},
    createdOn:{type: date},

});
categorySchema.pre('save' ,function(next){
    this.id = uuid.v1();
    this.updatedOn = new Date();
    this.createdOn = new Date();

    // Hash the password
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(this.password,salt);
    this.password = hash;

    next();
});

categorySchema.pre(['update' , 'findOneAndUpdate','updateOne'], function(next){
    const update = this.getUpdate();
    delete update._id;

    this.updateedOn = new Date();

    next();
});

const CategoryModel = model('category', categorySchema);

module.exports =  CategoryModel;