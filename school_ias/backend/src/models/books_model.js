const { Schema, model } = require("mongoose");
const { updateOne } = require("./user_model");

const BooksSchema = new Schema({
  name: { type: String, required: true },
  author: { type: String, required: true },
  publisher: { type: String, required: true },
  createdOn: { type: Date },
  updatedOn: { type: Date },
});
BooksSchema.pre("save", function (next) {
  this.createdOn = new Date();
  this.updatedOn = new Date();
  next();
});
BooksSchema.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const update = this.getUpdate();
  delete update._id;
  this.updatedOn = new Date();
  next();
});
const BooksModel = model("books", BooksSchema);
module.exports = BooksModel;
