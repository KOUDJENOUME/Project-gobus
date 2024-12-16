const MessageModel = require("../models/message.model");

class MessageService {
  // Méthode pour envoyer un message d'un client à un administrateur
  static async sendMessage(userId, content) {
    try {
      const newMessage = new MessageModel({
        userId: userId,
        content: content,
        sender: "client", // Définit l'expéditeur comme client
      });
      await newMessage.save();
      return newMessage;
    } catch (error) {
      console.error("Erreur lors de l'envoi du message :", error);
      throw error;
    }
  }
  static async replyToMessage(userId, content) {
    try {
      const replyMessage = new MessageModel({
        userId: userId,
        content: content,
        sender: "admin", // Définit l'expéditeur comme admin
      });
      await replyMessage.save();
      return replyMessage;
    } catch (error) {
      console.error("Erreur lors de la réponse au message :", error);
      throw error;
    }
  }

  static async getMessagesForAdmin() {
    try {
      const messages = await MessageModel.find({})
        .sort({ createdAt: -1 }) // Tri par date décroissante
        .populate("userId", "username email"); // Optionnel : pour récupérer des informations sur l'utilisateur
      return messages;
    } catch (error) {
      console.error("Erreur lors de la récupération des messages :", error);
      throw error;
    }
  }

  // Méthode pour marquer un message comme lu
  static async markMessageAsRead(messageId) {
    try {
      const message = await MessageModel.findByIdAndUpdate(
        messageId,
        { isRead: true },
        { new: true }
      );
      return message;
    } catch (error) {
      console.error("Erreur lors de la mise à jour du message :", error);
      throw error;
    }
  }
}

module.exports = MessageService;
