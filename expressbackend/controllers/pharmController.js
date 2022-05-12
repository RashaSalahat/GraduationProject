import PharmModel from "../models/pharm.js";
class PharmController{
    static getAllDoc=async(req,res)=>{
        try{
           const result= await PharmModel.find()
           res.send(result)
        }catch(err){
             console.log(err)
        }
    }
}


export default PharmController