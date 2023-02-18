const express = require('express')
const app = express()
const port = 3000
//const path=require('path');
const mongoose =require('mongoose')
const organizer=require('./model/organizer')
const volunteer = require('./model/volunteer');
app.use(express.urlencoded({extended:true}))
//const methodOverride = require('method-override')
mongoose.connect('mongodb://127.0.0.1:27017/KindKarma').then(()=>{
  console.log("connection open!!")
})
.catch(err =>{
    console.log("OH NO ERROR")
    console.log(err)
})
app.post('/volunteer',async (req,res)=>{
    console.log(req.body.volunteer1)
    // req.body in the form user,password 
    // to check valide email or not
    // double authentication
    const volunteer1 =new volunteer(req.body.volunteer);
    await volunteer1.save()
   res.send("Sucess")
})
app.post('/organizer',async (req,res) =>{
    console.log(req.body.organizer1)
     const organizer1 =new organizer(req.body.organizer);
    await organizer1.save()
   res.send("Sucess")
})
app.listen(port, () => {
  console.log(`Backend running on port ${port}`)
})