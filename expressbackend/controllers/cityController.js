import cityModel from "../models/city.js";
class CityController{
    static getAllDoc=async(req,res)=>{
        try{
           const result= await cityModel.find()
           res.send(result)
        }catch(err){
             console.log(err)
        }
    }
}


export default CityController