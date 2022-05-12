import express from 'express';
import mongoose from "mongoose";
import web from './routes/web.js'
// import connectDB from "../db/connectdb.js";
const connectDB =async (DATABASE_URL)=>{
    try{
        const DB_OPTIONS={
            dbName:'BabyTime'
        }
        await mongoose.connect(DATABASE_URL,DB_OPTIONS);
        console.log('connected successfully');
    } catch(err)
    {  console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        console.log(err);
    }
}

const app=express()
const port= process.env.PORT || '8001'
const DATABASE_URL=process.env.DATABASE_URL || "mongodb://localhost:27017/"

connectDB(DATABASE_URL);

app.use(express.json())
app.use("/api",web)

app.listen(port,()=>{
    console.log(`server listing at http://localhost:${port}`)
    })