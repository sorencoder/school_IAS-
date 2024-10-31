const BooksModel = require("./../models/books_model");
const mongoose = require("mongoose");
const BooksController = {
  createBook: async function (req, res) {
    try {
      const book = req.body;
      const newBook = new BooksModel(book);
      await newBook.save();
      return res.json({
        success: true,
        message: "New Book entered!",
        data: newBook,
      });
    } catch (error) {
      return res.json({ success: false, message: error });
    }
  },
  updatebook: async function (req, res) {
    const studentId = req.params.id;
    const updateData = req.body;
    try {
      const updatedStudent = await StudentModel.findOneAndUpdate(
        { _id: studentId },
        updateData,
        { new: true }
      );
      if (!updatedStudent) {
        return res.status(404).send("User not found");
      }
      return res.json({ status: 200, success: true, message: updatedStudent });
    } catch (error) {
      return res.json({ status: 500, success: false, message: "Server Error" });
    }
  },
  deletebook: async function (req, res) {
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
module.exports = BooksController;
