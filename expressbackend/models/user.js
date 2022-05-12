import mongoose from "mongoose";
const userSchema =new mongoose.Schema
({  //to define a shape and content of the doc
    username : {
        type : String,
        required: true
    },
    FavClinic : {
        type : String,
        required: true,
    },
    Fav: {
        type : Boolean,
        required: true,
    },
    type : {
        type: String,
        required: true,
        
    },
    
})
const UserModel =mongoose.model("user",userSchema)

export default UserModel
