const mongoose = require("mongoose");
const { Schema } = mongoose;

const notificationSchema = new Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User", // Référence à l'utilisateur
    required: true,
  },
  message: {
    type: String,
    required: true,
  },
  isRead: {
    type: Boolean,
    default: false, // Par défaut, la notification est non lue
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

const NotificationModel = mongoose.model("Notification", notificationSchema);
module.exports = NotificationModel;
