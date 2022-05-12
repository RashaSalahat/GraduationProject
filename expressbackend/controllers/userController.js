import UserModel from "../models/user.js";
class userController{
    static getAllDoc=async(req,res)=>{
        try{
           const result= await UserModel.find()
           res.send(result)
        }catch(err){
             console.log(err)
        }
    }
}


export default userController