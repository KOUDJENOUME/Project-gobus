const express = require("express");
const NotificationService = require("../services/notification.service");
const jwt = require("jsonwebtoken");
const router = express.Router();

// Tableau temporaire pour stocker les tokens
let availableTokens = []; 

// Middleware pour vérifier le token d'authentification
const authenticateToken = (req, res, next) => {
  const token = req.headers["authorization"]?.split(" ")[1]; // Récupère le token dans l'en-tête Authorization

  if (!token) {
    return res.status(401).json({ success: false, message: "Token manquant" });
  }

  console.log("Token reçu dans l'en-tête Authorization : ", token); // Log du token reçu

  // Ajouter le token dans le tableau des tokens disponibles (simule un stockage temporaire)
  if (!availableTokens.includes(token)) {
    availableTokens.push(token);
    console.log("Tous les tokens disponibles : ", availableTokens);
    console.log("Token ajouté aux tokens disponibles");
  }

  // Vérifie la validité du token
  jwt.verify(token, process.env.JWT_SECRET_KEY, (err, user) => {
    if (err) {
      console.error("Erreur de validation du token : ", err); // Log de l'erreur si le token est invalide
      return res.status(403).json({ success: false, message: "Token invalide" });
    }
    req.user = user; // Stocke les informations de l'utilisateur dans la requête
    next();
  });
};
router.delete("/notifications/:id", authenticateToken, async (req, res) => {
  const notificationId = req.params.id;
  const userId = req.user._id;

  try {
    const result = await NotificationService.deleteNotification(notificationId, userId);
    return res.status(200).json({
      success: true,
      message: "Notification supprimée avec succès.",
      data: result,
    });
  } catch (error) {
    return res.status(404).json({
      success: false,
      message: error.message || "Erreur lors de la suppression de la notification.",
    });
  }
});

// Route pour supprimer toutes les notifications d'un utilisateur
router.delete("/notifications", authenticateToken, async (req, res) => {
  const userId = req.user._id;

  try {
    const result = await NotificationService.deleteAllNotificationsForUser(userId);
    return res.status(200).json({
      success: true,
      message: "Toutes les notifications ont été supprimées avec succès.",
      data: result,
    });
  } catch (error) {
    return res.status(500).json({
      success: false,
      message: "Erreur lors de la suppression des notifications.",
    });
  }
});
// Route pour envoyer une notification à un utilisateur spécifique
router.post("/send-notification", (req, res) => {
  const { userId, message } = req.body; // Récupère l'ID de l'utilisateur et le message depuis le corps de la requête
  
  if (!userId || !message) {
    // Vérifie que les paramètres sont fournis
    return res.status(400).json({ success: false, message: "userId et message sont requis." });
  }

  try {
    // Appel du service NotificationService pour envoyer la notification
    NotificationService.sendNotification(userId, message);
    
    return res.status(200).json({ success: true, message: "Notification envoyée avec succès." });
  } catch (error) {
    // Gestion des erreurs
    console.error("Erreur lors de l'envoi de la notification :", error);
    return res.status(500).json({ success: false, message: "Erreur interne du serveur." });
  }
});

// Route pour récupérer les notifications de l'utilisateur connecté
router.get("/notifications", authenticateToken, async (req, res) => {
  try {
    const userId = req.user._id; // Récupère l'ID de l'utilisateur depuis le token
    console.log("Le userid du user " , userId);

    // Appel du service NotificationService pour récupérer les notifications de l'utilisateur
    const notifications = await NotificationService.getNotificationsForUser(userId);

    // Affiche tous les tokens disponibles et celui utilisé pour l'authentification
    console.log("Tous les tokens disponibles : ", availableTokens);
    console.log("Token utilisé pour l'authentification : ", req.headers["authorization"]);

    return res.status(200).json({
      success: true,
      notifications,
      availableTokens: availableTokens, // Retourne tous les tokens enregistrés
      usedToken: req.headers["authorization"] // Retourne le token utilisé dans cette requête
    });
  } catch (error) {
    console.error("Erreur lors de la récupération des notifications :", error);
    return res.status(500).json({ success: false, message: "Erreur interne du serveur." });
  }
});

module.exports = router;  // Exporter uniquement le router ici
