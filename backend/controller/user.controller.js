const UserServices = require('../services/user.service');
const crypto = require("crypto");
const UserModel = require("../models/user.model"); // Vérifiez le chemin relatif

const nodemailer = require("nodemailer");

exports.register = async (req, res, next) => {
    try {
        const { nom, prenom, email, password, modeDePaiement, preferencesDeNotification } = req.body;
        const duplicate = await UserServices.getUserByEmail(email);
        if (duplicate) {
            throw new Error(`UserName ${email}, Already Registered`);
        }
        await UserServices.registerUser(nom, prenom, email, password, modeDePaiement, preferencesDeNotification);
        res.json({ status: true, success: 'User registered successfully' });
    } catch (err) {
        next(err);
    }
};

exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            throw new Error('Parameters are not correct');
        }
        let user = await UserServices.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }
        const isPasswordCorrect = await user.comparePassword(password);
        if (!isPasswordCorrect) {
            throw new Error('Username or Password does not match');
        }
        let tokenData = { _id: user._id, email: user.email };
        const token = await UserServices.generateAccessToken(tokenData, "secret", "1h");
        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        next(error);
    }
};

exports.forgotPassword = async (req, res, next) => {
    try {
        const { email } = req.body;
        if (!email) {
            throw new Error("Email is required");
        }
        const user = await UserServices.getUserByEmail(email);
        if (!user) {
            throw new Error("User with this email does not exist");
        }
        // Stocker le token et la date d'expiration
        const expirationTime = Date.now() + 3600000; // 1 heure pour l'expiration
const resetToken = await UserServices.setPasswordResetToken(user._id); 
// resetToken est retourné ici, le token brut envoyé par email.
        const resetLink = `http://localhost:3000/reset-password/${resetToken}`;
        const transporter = nodemailer.createTransport({
            service: "Gmail",
            auth: {
                user: "modestekoudjenoume02@gmail.com",
                pass: "urob lsme eyck gkul",
            },
        });

        await transporter.sendMail({
            to: email,
            subject: "Réinitialisation de mot de passe",
            text: `Vous avez demandé une réinitialisation de mot de passe. Cliquez sur le lien suivant pour réinitialiser votre mot de passe : ${resetLink}`,
        });

        res.status(200).json({ status: true, message: "Reset password link sent to email" });
    } catch (err) {
        next(err);
    }
};

exports.resetPassword = async (req, res, next) => {
    try {
        const { token } = req.params;
        const { password } = req.body;

        if (!password) {
            throw new Error("Password is required");
        }
         // 1. Afficher tous les utilisateurs avec leurs tokens hachés
         const users = await UserModel.find();  // Récupérer tous les utilisateurs
         console.log("All users with hashed reset tokens:");
         users.forEach(user => {
             console.log(`Email: ${user.email}, Reset Token: ${user.passwordResetToken}`);
         });
 

        console.log("Reset token from URL:", token);
        const hashedToken = crypto.createHash("sha256").update(token).digest("hex");
        console.log("Hashed Reset Tokennn:", hashedToken);
     
        // Recherche de l'utilisateur avec le token haché
        const user = await UserServices.getUserByResetToken(hashedToken);
        if (!user) {
            throw new Error("Invalid or expired token");
        }

        console.log("User found for token reset:", user.email);

        // Vérification de l'expiration du token
        if (user.passwordResetExpires < Date.now()) {
            console.log("Token has expired:", user.passwordResetExpires);
            throw new Error("Token has expired");
        }

        // Mise à jour du mot de passe de l'utilisateur
        user.password = password;
        user.passwordResetToken = undefined;
        user.passwordResetExpires = undefined;

        // Sauvegarde des modifications
        await user.save();
        res.status(200).json({ status: true, message: "Password reset successful" });
    } catch (err) {
        next(err);
    }
};
