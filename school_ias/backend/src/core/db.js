const mongoose = require("mongoose");

mongoose
  .connect("<connection_string>")
  .then(() => console.log("Connected to MongoDB"))
  .catch((err) => console.error(err));

// Without a model (if you don't have one)
const collectionName = "test";
mongoose
  .collection(collectionName)
  .find({})
  .then((documents) => {
    console.log(documents); // Array of all documents
  })
  .catch((err) => console.error(err));
