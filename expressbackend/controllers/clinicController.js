import clinicModel from "../models/clinic.js";
class ClinicController{
    static getAllDoc=async(req,res)=>{
        try{
           const result= await clinicModel.find()
           res.send(result)
        }catch(err){
             console.log(err)
        }
    }
}


export default ClinicController