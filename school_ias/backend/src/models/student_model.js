const { Schema, model } = require("mongoose");
const uuid = require("uuid");

const StudentSchema = new Schema({
  id: { type: String, unique: true },
  name: { type: String, required: true },
  dateofbirth: { type: Date, required: true },
  aadharno: { type: Number, unique: true, required: true },
  caste: { type: String, required: true },
  class: { type: Number, required: true },
  email: { type: String },
  gender: { type: String, required: true },
  phoneno: { type: Number, required: true },
  createdOn: { type: Date },
  updatedOn: { type: Date },
});

StudentSchema.pre("save", function (next) {
  (this.id = uuid.v1()), (this.createdOn = new Date());
  this.updatedOn = new Date();
  next();
});

StudentSchema.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const studentData = this.getUpdate();
  delete studentData._id;
  delete studentData.id;
  this.updatedOn = new Date();
  next();
});

module.exports = model("Student", StudentSchema);
