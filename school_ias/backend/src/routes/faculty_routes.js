const FacultyController = require("./../controllers/faculty_controller");
const FacultyRoutes = require("express").Router();
FacultyRoutes.post("/create", FacultyController.facultycreate);
FacultyRoutes.put("/:id", FacultyController.updatefaculty);
FacultyRoutes.delete("/:id", FacultyController.deletefaculty);
module.exports = FacultyRoutes;
