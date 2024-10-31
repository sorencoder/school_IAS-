const BooksRoutes = require("express").Router();
const BooksController = require("./../controllers/books_controller");

BooksRoutes.post("/createBook", BooksController.createBook);

module.exports = BooksRoutes;
