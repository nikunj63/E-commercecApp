const UserModel = require("./../models/user_model");
const UserController = {

    createAccount: async function(req ,res) {
        try {
            const userData = req.body;
            const newUser = new UserModel(userData); 
            await newUser.save();
            
            return res.json({sucess: true, data: newUser , message:"User Created!"});
            
        } catch (ex) {
            return res.json({sucess:false, message: ex});
        }
    }
};

module.exports = UserController;