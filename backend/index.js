const { app, server } = require("./app");
const db = require("./config/db"); // Si vous avez une connexion à la base de données
require("dotenv").config();

const port = 3000;

app.get("/", (req, res) => {
  res.send("API is working successfully...");
});

server.listen(port, () => {
  console.log(`Server Listening on Port http://localhost:${port}`);
});
