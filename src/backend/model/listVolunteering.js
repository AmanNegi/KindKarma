const mangoose=require('mongoose');
const Schema=mangoose.Schema
const list =new Schema({
name: {
  type: String,
  //required: true
},
discription:{
  type: String,
//required: true
},
organizers:{
 type: String,
 //required: true
},
participants:{
    type: Array
},
place:{
type: String
},
helpDetails:{
   phone: {
        type: String
    },
  email:{
    type: String
  }
}
})
module.exports =mangoose.model('list',list) // name of the schema is volunteer