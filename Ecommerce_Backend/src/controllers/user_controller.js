const UserModel = require("./../models/user_model");
const bcrypt = require("bcrypt");
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
    },

    signIn: async function (req,res) {
        try {

            const {email, password} = req.body;
            const foundUser = await UserModel.findOne({email:email});
            if (!foundUser) {
                return res.json({sucess:false,message:"User not found!"});
            }

           const passWordMatch = bcrypt.compareSync(password,foundUser.password);
           if (!passWordMatch) {
            return res.json({sucess:false,message:"Incorrect Password!"});
           }

           return res.json({sucess:true,data: foundUser});

        } catch (ex) {
            return res.json({sucess:false,message:ex});
        }
    },

    updateUser: async function(req ,res){
        try {
            const userId = req.params.id;
            const updateData = req.body;

            const updatedUser = await UserModel.findOneAndUpdate(
                { _id:userId },
                updateData,
                {new: true}
            );

            if (!updateUser) {
                throw "user not found!";
            }

            return res.json({sucess:true, data: updatedUser, message:"User Updated!"});

        } catch (ex) {
            return res.json({sucess:false,message:ex});
        }
    }

};

module.exports = UserController;