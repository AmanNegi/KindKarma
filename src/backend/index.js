const express = require("express");
const app = express();
var bodyParser = require("body-parser");
const auth = require("./routes/auth");
const event= require("./routes/organize");

require("./src/db.js");

app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use("/auth", auth);
app.use("/event", event);

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Listening on ${port}...`);
});
