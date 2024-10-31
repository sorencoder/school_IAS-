const StudentModel = require("./../models/student_model");

const StudentController = {
  createstudent: async function (req, res) {
    try {
      const data = req.body;
      const newStudent = StudentModel(data);
      await newStudent.save();
      return res.json({
        status: 200,
        success: true,
        message: "New Student Added Successfully",
        data: newStudent,
      });
    } catch (error) {
      return res.json({ status: 500, success: false, message: "error" });
    }
  },
  updatestudent: async function (req, res) {
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
  deletestudent: async function (req, res) {
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
module.exports = StudentController;
