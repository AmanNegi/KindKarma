const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const VolunteeringEvent = new Schema({
  name: {
    type: String,
    //required: true
  },
  description: {
    type: String,
    //required: true
  },
  organizers: {
    type: [String],
    //required: true
  },
  participants: {
    type: [String],
  },
  place: {
    type: String,
  },
  helpDetails: {
    phone: {
      type: String,
    },
    email: {
      type: String,
    },
  },
});

module.exports = mongoose.model("VolunteeringEvent", VolunteeringEvent); // name of the schema is volunteer
