const express = require("express");
const mongoose = require("mongoose");
const bodyParcer = require("body-parser");
const UserRoutes = require("./routes/user_routes");
const BooksRoutes = require("./routes/books_routes");
const StudentRoutes = require("./routes/student_routes");
const FacultyRoutes = require("./routes/faculty_routes");
const app = express();
app.use(bodyParcer.json());
app.use(bodyParcer.urlencoded({ extended: false }));

mongoose.connect(
  "mongodb+srv://ishwar:908870pA.@cluster0.eflutav.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
);

const port = 5000;

app.use("/api/user", UserRoutes);
app.use("/api/books", BooksRoutes);
app.use("/api/students", StudentRoutes);
app.use("/api/faculty", FacultyRoutes);

app.get("/", (req, res) => {
  res.json({ status: 200, message: "All the system are running" });
});

app.listen(port, () => {
  console.log(`Server Running on port ${port}`);
});
