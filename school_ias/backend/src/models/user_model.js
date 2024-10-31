const { Schema, model } = require("mongoose");
const uuid = require("uuid");
const bcrypt = require("bcrypt");
const userSchemma = new Schema({
  id: { type: String, unique: true },
  fullName: { type: String, default: "" },
  email: { type: String, unique: true, required: true },
  password: { type: String, required: true },
  createdOn: { type: Date },
  updatedOn: { type: Date },
});

userSchemma.pre("save", function (next) {
  (this.id = uuid.v1()), (this.createdOn = new Date());
  this.updatedOn = new Date();

  //Hash the password
  const hashed = bcrypt.hashSync(this.password, bcrypt.genSaltSync(8));
  this.password = hashed;
  next();
});

userSchemma.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const update = this.getUpdate();
  delete update._id;
  delete update.id;
  this.updatedOn = new Date();
  next();
});
const UserModel = model("User", userSchemma);
module.exports = UserModel;
