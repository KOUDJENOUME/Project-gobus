const bcrypt = require("bcrypt");

const mongoose = require("mongoose");
const { Schema } = mongoose;

const userSchema = new Schema(
  {
    nom: {
      type: String,
      required: [true, "Nom is required"],
    },
    prenom: {
      type: String,
      required: [true, "Prenom is required"],
    },
    email: {
      type: String,
      lowercase: true,
      required: [true, "userName can't be empty"],
      match: [
        /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/,
        "userName format is not correct",
      ],
      unique: true,
    },
    password: {
      type: String,
      required: [true, "password is required"],
    },
    modeDePaiement: {
      type: String,
      required: [true, "modeDePaiement is required"],
    },
    preferencesDeNotification: {
      type: String,
      required: [true, "preferencesDeNotification is required"],
    },
    role: { type: String, enum: ["user", "admin"], default: "user" },
    passwordResetToken: {
      // Token de réinitialisation du mot de passe
      type: String,
    },
    passwordResetExpires: {
      // Expiration du token de réinitialisation
      type: Date,
    },
    isBlocked: {
      // Indique si l'utilisateur est bloqué
      type: Boolean,
      default: false,
    },
    blockExpires: {
      // Expiration du blocage (null si permanent)
      type: Date,
      default: null,
    },
  },
  { timestamps: true }
);

// Middleware pour hacher le mot de passe avant sauvegarde
userSchema.pre("save", async function () {
  var user = this;
  if (!user.isModified("password")) {
    return;
  }
  try {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(user.password, salt);

    user.password = hash;
  } catch (err) {
    throw err;
  }
});

// Comparaison des mots de passe (connexion)
userSchema.methods.comparePassword = async function (candidatePassword) {
  try {
    const isMatch = await bcrypt.compare(candidatePassword, this.password);
    console.log("Password match:", isMatch);
    return isMatch;
  } catch (error) {
    throw error;
  }
};

// Vérification si l'utilisateur est bloqué
userSchema.methods.isAccountBlocked = function () {
  // Si "blockExpires" est défini et expiré, débloquer automatiquement
  if (this.blockExpires && this.blockExpires < Date.now()) {
    this.isBlocked = false;
    this.blockExpires = null;
    this.save(); // Enregistrer les modifications dans la base de données
    return false;
  }
  return this.isBlocked;
};

const UserModel = mongoose.model("user", userSchema);
module.exports = UserModel;

// Ajouter un administrateur par défaut lors de la création de la base de données

const createAdmin = async () => {
  const existingAdmin = await UserModel.findOne({ email: "admin@example.com" });

  if (!existingAdmin) {
    const admin = new UserModel({
      nom: "Admin",
      prenom: "Default",
      email: "admin@example.com",
      password: "adminpassword", // Hashé dans la base de données
      role: "admin", // Définir le rôle comme admin
      modeDePaiement: "CreditCard",
      preferencesDeNotification: true,
    });

    await admin.save();
    console.log("Admin par défaut créé avec succès.");
  }
};

createAdmin();
