const express = require("express");
const list = require("./model/listVolunteering");
// var session = require('express-session');
const app = express();
var bodyParser = require("body-parser");
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
app.use(bodyParser.json());
//const path=require('path');
const mongoose = require("mongoose");
const organizer = require("./model/organizer");
const volunteer = require("./model/volunteer");
app.use(express.urlencoded({ extended: true }));
//const methodOverride = require('method-override')
mongoose
  .connect(process.env.DATABASE_URL)
  // .connect("mongodb://127.0.0.1:27017/KindKarma")
  .then(() => {
    console.log("connection open!!");
  })
  .catch((err) => {
    console.log("OH NO ERROR");
    console.log(err);
  });
function emailPasswordCheck(email, pass) {
  const Emailregex = new RegExp("/^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3}");
  const passRegex = new RegExp("?=.*[a-z]"); // for no I added simple password checker
  return regex.test(email) && passRegex.test(pass);
}
app.post("/volunteer", async (req, res) => {
  console.log(req.body);
  // req.body in the form user,password
  // to check valide email or not
  // double authentication
  const check = await organizer.find({ email: req.body.email }).exec();
  if (check.length || emailPasswordCheck(req.body.email, req.body.password)) {
    //  console.log("failed")
    res.send("fail");
    return;
  }
  const volunteer1 = new volunteer(req.body);
  await volunteer1.save();
  res.send("Sucess");
});
app.post("/organizer", async (req, res) => {
  console.log(req.body); // if you want you can just keep req.body.organizer care should be taken in sending response
  const check = await organizer.find({ email: req.body.email }).exec();
  //console.log(check.length)
  // checking whethee the user is already exit or not
  // checking the email and password
  if (check.length || emailPasswordCheck(req.body.email, req.body.password)) {
    //  console.log("failed")
    res.send("fail");
    return;
  }
  const organizer1 = new organizer(req.body);
  await organizer1.save();
  res.send("Sucess");
  return;
});
app.get("/login/organizer", async (req, res) => {
  const check = await organizer.find({ email: req.params.email }).exec(); // checking by email
  if (check.length) {
    // we can also findOne function
    //  console.log("failed")
    res.send("fail");
    return;
  }
  elseif(check[0].password === req.params.password);
  {
    // generate the session
    // Store the user's primary key
    // in the session store to be retrieved,
    // or in this case the entire user object
    // if any body know better idea on session just implement
    // req.session.user = user;
    // ***** here sesion code ***
    res.send(check[0]); // or use findOne method
    return;
  }
});
app.get("/login/volunteer", async (req, res) => {
  const check = await organizer.find({ email: req.params.volunteer }).exec(); // checking by email
  if (check.length) {
    // we can also findOne function
    //  console.log("failed")
    res.send("fail");
    return;
  }
  elseif(check[0].password === req.params.password);
  {
    // generate the session
    // Store the user's primary key
    // in the session store to be retrieved,
    // or in this case the entire user object
    // if any body know better idea on session just implement
    // req.session.user = user;
    // ***** here sesion code ***
    res.send(check[0]); // or use findOne method
    return;
  }
});
app.get("/logout", async (req, res) => {
  // if any know how to destroy session implement
  res.send("logOut");
});
app.get("/list", async (req, res) => {
  res.send(await list.find({})); // sending in format of list
});
app.listen(process.env.PORT || 3000, () => {
  console.log(`Backend running on port ${port}`);
});
