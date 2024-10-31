const FacultyModel = require("./../models/faculty_model");

const FacultyController = {
  facultycreate: async function (req, res) {
    try {
      const data = req.body;
      const newFaculty = FacultyModel(data);
      await newFaculty.save();
      return res.json({
        status: 200,
        success: true,
        message: "New Faculty Added Successfully",
        data: newFaculty,
      });
    } catch (error) {
      return res.json({
        status: 500,
        success: false,
        message: error,
      });
    }
  },
  updatefaculty: async function (req, res) {
    const facultyId = req.params.id;
    const updateData = req.body;
    try {
      const updatedFaculty = await FacultyModel.findOneAndUpdate(
        { _id: facultyId },
        updateData,
        { new: true }
      );
      if (!updatedFaculty) {
        return res.status(404).send("Faculty not found");
      }
      return res.json({ status: 200, success: true, message: updatedFaculty });
    } catch (error) {
      return res.json({ status: 500, success: false, message: "Server Error" });
    }
  },
  deletefaculty: async function (req, res) {
    const facultyId = req.params.id;
    try {
      const deletefaculty = await FacultyModel.deleteOne({ _id: facultyId });
      if (deletefaculty.deletedCount === 0) {
        return res.status(404).send("Faculty not found");
      }
    } catch (error) {
      return res.status(500).send("Server Error");
    }
  },
};
module.exports = FacultyController;
