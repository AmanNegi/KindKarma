var router = require("express").Router();

const Organizer = require("../model/organizer");
const Volunteer = require("../model/volunteer");

router.get("/", async (req, res) => {
  return res.send("Let's authenticate");
});

router.get("/login/organizer", async (req, res) => {
  console.log(req.query);
  const check = await Organizer.find({ email: req.query.email }).exec(); // checking by email
  console.log(check);
  if (check.length === 0) {
    return res.status(400).send("No Organizer matches these details");
  }

  if (check[0].password === req.params.password);
  {
    // generate the session
    // Store the user's primary key
    // in the session store to be retrieved,
    // or in this case the entire user object
    // if any body know better idea on session just implement
    // req.session.user = user;
    // ***** here sesion code ***
    res.status(200).send(check[0]); // or use findOne method
    return;
  }
});

router.get("/login/volunteer", async (req, res) => {
  console.log(req.query);
  const check = await Volunteer.find({ email: req.query.email }).exec(); // checking by email
  console.log(check);
  if (check.length === 0) {
    return res.status(400).send("No Volunteer matches these details");
  }

  if (check[0].password === req.params.password);
  {
    // generate the session
    // Store the user's primary key
    // in the session store to be retrieved,
    // or in this case the entire user object
    // if any body know better idea on session just implement
    // req.session.user = user;
    // ***** here sesion code ***
    res.status(200).send(check[0]); // or use findOne method
    return;
  }
});

router.post("/signup/volunteer", async (req, res) => {
  //TODO:  Check if body = {email, password, username}

  const response = await Organizer.find({ email: req.body.email }).exec();
  if (response.length > 0) {
    return res.status(400).send("A User with this email already exists");
  }
  const newVolunteer = new Volunteer(req.body);
  await newVolunteer.save();
  return res.status(200).send("Congrats! You have signed in successfully!");
});

router.post("/signup/organizer", async (req, res) => {
  //TODO:  Check if body = {email, password, username}
  const check = await Organizer.find({ email: req.body.email }).exec();

  if (check.length > 0) {
    return res.status(400).send("A User with this email already exists");
  }
  const newOrganizer = new Organizer(req.body);
  await newOrganizer.save();
  return res.status(200).send("Congrats! You have signed in successfully!");
});

//TODO: Implement this method
router.get("/logout", async (req, res) => {
  // if any know how to destroy session implement
  res.send("logOut");
});

function emailPasswordCheck(email, pass) {
  const Emailregex = new RegExp("/^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3}");
  const passRegex = new RegExp("?=.*[a-z]"); // for no I added simple password checker
  return regex.test(email) && passRegex.test(pass);
}

module.exports = router;
