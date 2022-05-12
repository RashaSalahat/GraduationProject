import mongoose from "mongoose";
const toySchema =new mongoose.Schema
({  //to define a shape and content of the doc
    name : {
        type : String,
        required: true
    },
    describtion : {
        type: String,
        required: true,
    },
    typeT : {type:String},
    stores: {type:String}
})
const ToyModel =mongoose.model("toy",toySchema)

export default ToyModel

