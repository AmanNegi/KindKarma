const app = require("express")();
const list = require("../model/listVolunteering");

app.get("/list", async (req, res) => {
  res.send(await list.find({})); // sending in format of list
});

function emailPasswordCheck(email, pass) {
  const Emailregex = new RegExp("/^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3}");
  const passRegex = new RegExp("?=.*[a-z]"); // for no I added simple password checker
  return regex.test(email) && passRegex.test(pass);
}
