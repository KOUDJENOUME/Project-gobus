const mongoose = require("mongoose");
const { Schema } = mongoose;

const messageSchema = new Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "user", // Référence à l'utilisateur (client)
    required: true,
  },
  sender: { 
    type: String,
    enum: ["client", "admin"],
    required: true 
  }, // Indique l'expéditeur

  content: {
    type: String,
    required: true,
  },
  isRead: {
    type: Boolean,
    default: false, // Par défaut, le message n'est pas lu
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

const MessageModel = mongoose.model("Message", messageSchema);
module.exports = MessageModel;
