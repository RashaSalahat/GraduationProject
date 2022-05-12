import mongoose from "mongoose";
const citySchema =new mongoose.Schema
({  //to define a shape and content of the doc
    name : {
        type : String,
        required: true
    },
})
const CityModel  =mongoose.model("city",citySchema)

export default CityModel
