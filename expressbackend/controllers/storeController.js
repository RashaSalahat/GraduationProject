import StoreModel from "../models/store.js";
class StoreController{
    static getAllDoc=async(req,res)=>{
        try{
           const result= await StoreModel.find()
           res.send(result)
        }catch(err){
             console.log(err)
        }
    }
}


export default StoreController