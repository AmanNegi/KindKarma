var router = require("express").Router();

const Organizer = require("../model/organizer");
const VolunteeringEvent = require("../model/volunteering_event");

router.get("/", async (req, res) => {
  return res.json("Let's Organize!");
});

router.post("/demo-add", async (req, res) => {
  var event = new VolunteeringEvent(cloneData);
  await event.save();
  return res.status(200).json({ message: "Added Demo Data Successfully" });
});

router.post("/add", async (req, res) => {
  //TODO: Add Checks Here
  var event = new VolunteeringEvent(cloneData);
  await event.save();

  return res.status(200).json({ message: "Added Data Successfully" });
});

router.get("/list", async (req, res) => {
  var data = await VolunteeringEvent.find({});
  return res.status(200).json({ data: data });
});

module.exports = router;

var cloneData = {
  name: "Event Name 1 ",
  description: "Description",
  organizers: ["a", "b", "c"],
  participants: ["u1", "u2", "u3"],
  place: "",
  helpDetails: {
    phone: "4362790234",
    email: "asterjoules@gmail.com",
  },
};
