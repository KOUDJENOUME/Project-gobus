const NotificationModel = require("../models/notification.model"); // Import du modèle

class NotificationService {
  // Méthode pour envoyer une notification
  static async sendNotification(userId, message) {
    try {
      // Création de la notification dans la base de données
      const newNotification = new NotificationModel({
        userId: userId,
        message: message,
      });
      await newNotification.save(); // Sauvegarde dans la base de données

      // Envoi de la notification via WebSocket ou autre mécanisme en temps réel
      // Exemple : socket.emit('notification', message);
    } catch (error) {
      console.error("Erreur lors de l'envoi de la notification :", error);
      throw error;
    }
  }
// Méthode pour supprimer une notification
static async deleteNotification(notificationId, userId) {
  try {
    // Supprime la notification correspondant à l'ID et à l'utilisateur
    const result = await NotificationModel.findOneAndDelete({
      _id: notificationId,
      userId: userId,
    });

    // Vérifie si une notification a été supprimée
    if (!result) {
      throw new Error("Notification introuvable ou non autorisée.");
    }
    return result;
  } catch (error) {
    console.error("Erreur lors de la suppression de la notification :", error);
    throw error;
  }
}

// Méthode pour supprimer toutes les notifications d'un utilisateur
static async deleteAllNotificationsForUser(userId) {
  try {
    // Supprime toutes les notifications associées à l'utilisateur
    const result = await NotificationModel.deleteMany({ userId: userId });
    return result;
  } catch (error) {
    console.error("Erreur lors de la suppression des notifications :", error);
    throw error;
  }
}

  // Méthode pour récupérer les notifications d'un utilisateur
  static async getNotificationsForUser(userId) {
    try {
      // Récupération des notifications pour un utilisateur donné
      const notifications = await NotificationModel.find({ userId }).sort({ createdAt: -1 }); // Tri par date décroissante
      return notifications;
    } catch (error) {
      console.error("Erreur lors de la récupération des notifications :", error);
      throw error;
    }
  }
}

module.exports = NotificationService;
