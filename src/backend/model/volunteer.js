const mangoose=require('mongoose');
const Schema=mangoose.Schema
const volunteer =new Schema({
 name: String,
 password: String,
})
module.exports =mangoose.model('volunteer',volunteer) // name of the schema is volunteer