import UserModel from "../models/user.js";
//var User = require('../models/user.js')
class userUpdate{
    static addNew=async (req, res)=> {
        
        
            var newUser = UserModel({
                username : req.body.username,
                FavClinic :req.body.FavClinic ,
                Fav: req.body.Fav,
                type : req.body.type
                })
            dbo.collection('user').insertOne(newUser,function(err,res){
                if (err) {
                    res.json({success: false, msg: 'Failed to save'})
                }
                else {
                    res.json({success: true, msg: 'Successfully saved'}),
                    console.log("name:" +  req.body.username);
                
                    
                }
            })
            
        }
    }



export default userUpdate