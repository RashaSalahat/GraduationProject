import mongoose from "mongoose";
const clinicSchema =new mongoose.Schema
({  //to define a shape and content of the doc
    name : {
        type : String,
        required: true
    },
    doctor : {
        type: String,
        required: true,
        
    },
    country : {
        type: String,
        required: true,
        
    },
    address : {
        type: String,
        required: true,
        
    },
    information: String,
    status : String
})
const ClinicModel  =mongoose.model("clinic",clinicSchema)

export default ClinicModel
