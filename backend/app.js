const express = require("express");
const bodyParser = require("body-parser");
require('dotenv').config();

const UserRoute = require("./routes/user.routes");
const NotificationRoute = require("./routes/notification.routes");
const message = require("./routes/message.routes");  // Assurez-vous que le chemin est correct

const http = require("http");
const { Server } = require("socket.io");
const cors = require("cors");
const path = require("path");

const app = express();
const server = http.createServer(app); // Crée un serveur HTTP
const io = new Server(server, {
  cors: {
    origin: "*", // Changez cette URL en production
    methods: ["GET", "POST"]
  }
});

// Middleware pour parser le corps de la requête (req.body)
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(bodyParser.json());

// Autoriser CORS pour éviter les problèmes de partage de ressources entre serveurs
app.use(cors());

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Routes principales
app.use("/", UserRoute);
app.use("/", NotificationRoute);

// Ajoutez la route pour les messages
app.use("/", message);  // Ajoutez cette ligne pour définir le chemin de l'API des messages

// Stockage des connexions des utilisateurs pour envoyer des notifications
const connectedUsers = {}; // Pour associer un userId à son socket ID

// Connexion des utilisateurs via Socket.IO
io.on("connection", (socket) => {
  console.log("Un utilisateur est connecté :", socket.id);

  // Enregistrer un utilisateur avec son socket ID
  socket.on("register", (userId) => {
    connectedUsers[userId] = socket.id;
    console.log(`Utilisateur ${userId} enregistré avec socket ID : ${socket.id}`);
  });

  // Gérer la déconnexion d'un utilisateur
  socket.on("disconnect", () => {
    const userId = Object.keys(connectedUsers).find(
      (key) => connectedUsers[key] === socket.id
    );
    if (userId) {
      delete connectedUsers[userId];
      console.log(`Utilisateur ${userId} déconnecté.`);
    }
  });

  // Gestion des erreurs de Socket.IO
  socket.on("error", (err) => {
    console.error("Erreur Socket.IO:", err);
  });
});

// Envoi d'une notification à un utilisateur spécifique
const NotificationService = {
  sendNotification: (userId, message) => {
    if (connectedUsers[userId]) {
      io.to(connectedUsers[userId]).emit("notification", { message });
      console.log(`Notification envoyée à l'utilisateur ${userId}: ${message}`);
    } else {
      console.log(`Utilisateur ${userId} non connecté.`);
    }
  }
};

// Exemple d'envoi d'une notification
// NotificationService.sendNotification('user123', 'Vous avez une nouvelle tâche !');

module.exports = { app, server, io, NotificationService };
