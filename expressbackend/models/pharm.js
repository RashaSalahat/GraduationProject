import mongoose from "mongoose";
const pharmSchema =new mongoose.Schema
({  //to define a shape and content of the doc
    name : {
        type : String,
        required: true
    },
    country : {
        type: String,
        required: true,
    },
    drname : {
        type: String,
        required: true,
    },
    address : {
        type: String,
        required: true,
    },
    status : {type:String},
    duty: {type:String},
    openst: {type:String}
})
const PharmModel =mongoose.model("pharm",pharmSchema)

export default PharmModel

