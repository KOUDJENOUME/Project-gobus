const express = require("express");
const MessageService = require("../services/message.service");
const jwt = require("jsonwebtoken");
const router = express.Router();

// Middleware pour vérifier le token d'authentification
const authenticateToken = (req, res, next) => {
  const token = req.headers["authorization"]?.split(" ")[1];

  if (!token) {
    return res.status(401).json({ success: false, message: "Token manquant" });
  }

  jwt.verify(token, process.env.JWT_SECRET_KEY, (err, user) => {
    if (err) {
      return res.status(403).json({ success: false, message: "Token invalide" });
    }
    req.user = user;
    next();
  });
};

// Route pour envoyer un message
router.post("/send-message", authenticateToken, async (req, res) => {
  const {content } = req.body;

  if (!content) {
    return res.status(400).json({ success: false, message: " content est requis." });
  }

  try {
    const userId = req.user._id; // Récupère l'ID de l'utilisateur depuis le token
    const message = await MessageService.sendMessage(userId, content);
    return res.status(200).json({ success: true, message: "Message envoyé avec succès.", data: message });
  } catch (error) {
    return res.status(500).json({ success: false, message: "Erreur interne du serveur." });
  }
});
// Route pour répondre à un message
router.post("/reply-message", authenticateToken, async (req, res) => {
  const { userId, content } = req.body;

  // Vérification des champs obligatoires
  if (!userId || !content) {
    return res
      .status(400)
      .json({ success: false, message: "userId et content sont requis." });
  }

  try {
    // Appel du service pour enregistrer la réponse
    const reply = await MessageService.replyToMessage(userId, content);
    return res
      .status(200)
      .json({ success: true, message: "Réponse envoyée avec succès.", data: reply });
  } catch (error) {
    return res.status(500).json({
      success: false,
      message: "Erreur lors de l'envoi de la réponse.",
    });
  }
})
router.get("/messages", async (req, res) => {
    try {
      // Récupérer les messages envoyés par les clients
      const messages = await MessageService.getMessagesForAdmin();
      return res.status(200).json({ success: true, messages });
    } catch (error) {
      return res.status(500).json({ success: false, message: "Erreur interne du serveur." });
    }
  });
  
// Route pour marquer un message comme lu
router.patch("/messages/:id/read", authenticateToken, async (req, res) => {
  try {
    const messageId = req.params.id;
    const message = await MessageService.markMessageAsRead(messageId);
    return res.status(200).json({ success: true, message: "Message marqué comme lu.", data: message });
  } catch (error) {
    return res.status(500).json({ success: false, message: "Erreur interne du serveur." });
  }
});

module.exports = router;
