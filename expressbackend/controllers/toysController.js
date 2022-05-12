import ToyModel from "../models/toy.js";
class ToyController{
    static getAllDoc=async(req,res)=>{
        try{
           const result= await ToyModel.find()
           res.send(result)
        }catch(err){
             console.log(err)
        }
    }
}


export default ToyController