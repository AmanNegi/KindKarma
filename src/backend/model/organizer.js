const mangoose=require('mongoose');
const Schema=mangoose.Schema
const organizer =new Schema({
username:{
  type: String,
  required: true
},
password:{
 type: String,
 required: true
}
})
module.exports =mangoose.model('organizer',organizer) // name of the schema is volunteer
