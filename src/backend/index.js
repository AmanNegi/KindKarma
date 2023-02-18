const express = require("express");
const app = express();
var bodyParser = require("body-parser");
const auth = require("./routes/auth");

require("./src/db.js");

app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use("/auth", auth);

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Listening on ${port}...`);
});
