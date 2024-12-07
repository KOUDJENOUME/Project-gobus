const UserModel = require("../models/user.model");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");

class UserServices {
    // Enregistrement de l'utilisateur avec email et mot de passe
    static async registerUser(nom, prenom, email, password, modeDePaiement, preferencesDeNotification) {
        try {
            // Vérification du format de l'email
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                throw new Error('Invalid email format');
            }

            // Vérification de la longueur du mot de passe
            if (password.length < 6) {
                throw new Error('Password must be at least 6 characters long');
            }

            // Vérification si l'email est déjà pris
            const existingUser = await UserModel.findOne({ email });
            if (existingUser) {
                throw new Error('Email already registered');
            }

            // Création de l'utilisateur, le mot de passe sera hashé grâce au hook pre-save du modèle
            const createUser = new UserModel({ nom, prenom, email, password, modeDePaiement, preferencesDeNotification });
            await createUser.save(); // Sauvegarde de l'utilisateur
            return createUser;
        } catch (err) {
            console.error("Error during user registration:", err);
            throw err;
        }
    }

    // Recherche d'un utilisateur par email
    static async getUserByEmail(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (err) {
            console.error("Error fetching user by email:", err);
            throw err;
        }
    }

    // Vérification de l'existence de l'utilisateur par email (identique à getUserByEmail)
    static async checkUser(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (error) {
            console.error("Error checking user:", error);
            throw error;
        }
    }

    // Génération du token JWT
    static async generateAccessToken(tokenData, JWTSecret_Key, JWT_EXPIRE) {
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }

    // Génération et stockage d'un token de réinitialisation de mot de passe
    static async setPasswordResetToken(userId) {
        try {
            const resetToken = crypto.randomBytes(32).toString("hex");
            const hashedToken = crypto.createHash("sha256").update(resetToken).digest("hex");
            const expirationTime = Date.now() + 3600000; // 1 heure de validité

            await UserModel.findByIdAndUpdate(userId, {
                passwordResetToken: hashedToken,
                passwordResetExpires: expirationTime,
            });

            return resetToken; // Le token brut sera envoyé par email
        } catch (error) {
            console.error("Error setting password reset token:", error);
            throw error;
        }
    }

    // Récupération d'un utilisateur par le token de réinitialisation
    static async getUserByResetToken(hashedToken) {
        try {
            return await UserModel.findOne({
                passwordResetToken: hashedToken,
                passwordResetExpires: { $gt: Date.now() }, // Vérifie que le token n'est pas expiré
            });
        } catch (error) {
            console.error("Error fetching user by reset token:", error);
            throw error;
        }
    }

    // Réinitialisation du mot de passe de l'utilisateur
    static async resetPassword(userId, newPassword) {
        try {
            const user = await UserModel.findById(userId);
            if (!user) {
                throw new Error("User not found");
            }

            // Hacher le nouveau mot de passe si nécessaire (en fonction du hook pre-save)
            user.password = newPassword; // Le mot de passe sera hashé grâce au hook pre-save
            user.passwordResetToken = undefined;
            user.passwordResetExpires = undefined;

            await user.save();
        } catch (error) {
            console.error("Error resetting password:", error);
            throw error;
        }
    }
}

module.exports = UserServices;
