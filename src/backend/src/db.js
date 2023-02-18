const mongoose = require("mongoose");

const databaseURL =
  process.env.DATABASE_URL || "mongodb://127.0.0.1:27017/KindKarma";

mongoose
  .connect(databaseURL)
  .then(() => {
    console.log("Connected to MongoDB Successfully");
  })
  .catch((err) => {
    console.log("An Error occurred while connecting to MongoDB", err);
  });
