const { Schema, model } = require("mongoose");
const uuid = require("uuid");

const FacultySchema = new Schema({
  id: { type: String, unique: true },
  name: { type: String, required: true },
  dateofbirth: { type: Date, required: true },
  aadharno: { type: Number, unique: true, required: true },
  caste: { type: String, required: true },
  email: { type: String },
  gender: { type: String, required: true },
  phoneno: { type: Number, required: true },
  createdOn: { type: Date },
  updatedOn: { type: Date },
});

FacultySchema.pre("save", function (next) {
  (this.id = uuid.v1()), (this.createdOn = new Date());
  this.updatedOn = new Date();
  next();
});

FacultySchema.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const facultytData = this.getUpdate();
  delete facultytData._id;
  delete facultytData.id;
  this.updatedOn = new Date();
  next();
});

module.exports = model("Faculty", FacultySchema);
