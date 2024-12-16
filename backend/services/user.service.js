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
    static async generateAccessToken(tokenData) {
        const JWTSecret_Key = process.env.JWT_SECRET_KEY; // Chargé depuis l'environnement
        const JWT_EXPIRE = process.env.JWT_EXPIRE || "1h"; // Durée par défaut si non définie
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
      }
      
      static async deleteUser(userId) {
        try {
            const deletedUser = await UserModel.findByIdAndDelete(userId);
            if (!deletedUser) {
                throw new Error("User not found");
            }
            return deletedUser;
        } catch (error) {
            console.error("Error deleting user:", error);
            throw error;
        }
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
    static async blockUser(userId, durationInHours = 0) {
        try {
            let blockExpires = null;
            if (durationInHours > 0) {
                blockExpires = Date.now() + durationInHours * 3600000; // Durée de blocage en ms
            }
            await UserModel.findByIdAndUpdate(userId, {
                isBlocked: true,
                blockExpires,
            });
            return { success: true, message: "User blocked successfully" };
        } catch (error) {
            console.error("Error blocking user:", error);
            throw error;
        }
    }

    // Méthode pour débloquer un utilisateur
    static async unblockUser(userId) {
        try {
            await UserModel.findByIdAndUpdate(userId, {
                isBlocked: false,
                blockExpires: null,
            });
            return { success: true, message: "User unblocked successfully" };
        } catch (error) {
            console.error("Error unblocking user:", error);
            throw error;
        }
    }

    // Méthode pour vérifier si un utilisateur est bloqué
    static async isUserBlocked(userId) {
        try {
            const user = await UserModel.findById(userId);
            if (!user) {
                throw new Error("User not found");
            }

            // Vérifiez si le blocage est expiré
            if (user.blockExpires && user.blockExpires < Date.now()) {
                // Débloquez automatiquement l'utilisateur si le blocage a expiré
                await this.unblockUser(userId);
                return false;
            }

            return user.isBlocked;
        } catch (error) {
            console.error("Error checking if user is blocked:", error);
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
