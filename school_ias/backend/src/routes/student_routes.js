const StudentController = require("./../controllers/student_controller");
const StudentRoutes = require("express").Router();
StudentRoutes.post("/create", StudentController.createstudent);
StudentRoutes.put("/:id", StudentController.updatestudent);
StudentRoutes.delete("/:id", StudentController.deletestudent);
module.exports = StudentRoutes;
