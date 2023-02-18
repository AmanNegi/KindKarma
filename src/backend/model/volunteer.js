const mangoose=require('mongoose');
const Schema=mangoose.Schema
const volunteer =new Schema({
 email: {
  type: String,
  required: true
},
 username: {
        type: String,
        required: true
    },
 password: {
    type: String,
    required: true
 }
})
module.exports =mangoose.model('volunteer',volunteer) // name of the schema is volunteer
