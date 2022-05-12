import mongoose from "mongoose";
const storeSchema =new mongoose.Schema(
    {
        name:{type:String,required:true,trim:true},
        city:{type:String,required:true,trim:true},
        starttime:{type:String,required:true,trim:true},
        endtime:{type:String,required:true,trim:true},
        describtion: String,
        rating: Intl,
    }
)
const StoreModel =mongoose.model("store",storeSchema)

export default StoreModel