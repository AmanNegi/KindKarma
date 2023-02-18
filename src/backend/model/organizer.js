const mangoose=require('mongoose');
const Schema=mangoose.Schema
const organizer =new Schema({
 name: String,
 password: String,
})
module.exports =mangoose.model('organizer',organizer) // name of the schema is volunteer
