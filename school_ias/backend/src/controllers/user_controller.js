const UserModel = require("./../models/user_model");
const bcrypt = require("bcrypt");
const mongoose = require("mongoose");

const UserController = {
  createAccount: async function (req, res) {
    try {
      const userData = req.body;
      const newUser = new UserModel(userData);
      await newUser.save();
      return res.json({
        success: true,
        message: "User Created!",
        data: newUser,
      });
    } catch (error) {
      return res.json({ success: false, message: error });
    }
  },

  signIn: async function (req, res) {
    try {
      const { email, password } = req.body;
      const foundUser = await UserModel.findOne({ email });
      if (!foundUser) {
        return res.json({ success: false, message: "User not found" });
      }
      const passwordMatch = bcrypt.compareSync(password, foundUser.password);
      if (!passwordMatch) {
        return res.json({ success: false, message: "Incorrect password!" });
      }
      return res.json({ success: true, data: foundUser });
    } catch (error) {
      return res.json({ success: false, message: error });
    }
  },
  updateUser: async function (req, res) {
    const userId = req.params.id;
    const updateData = req.body;
    try {
      const objectId = mongoose.Types.ObjectId(userId);
      console.log(objectId);

      const query = { _id: objectId };
      console.log(query);
    } catch (error) {}
  },
  deleteuser: async function (req, res) {
    const studentId = req.params.id;
    try {
      const deleteStudent = await StudentModel.deleteOne({ _id: studentId });
      if (deleteStudent.deletedCount === 0) {
        return res.status(404).send("User not found");
      }
    } catch (error) {
      return res.status(500).send("Server Error");
    }
  },
};

module.exports = UserController;
