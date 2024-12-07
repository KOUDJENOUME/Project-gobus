const express = require("express");
const bodyParser = require("body-parser")
const UserRoute = require("./routes/user.routes");
const ToDoRoute = require('./routes/todo.routes');
const app = express();
const path = require('path');
// Middleware pour parser le corps de la requête (req.body)
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(bodyParser.json())
app.set("view engine", "ejs");
app.set('views', path.join(__dirname, 'views'));

app.use("/",UserRoute);
app.use("/",ToDoRoute);

module.exports = app;