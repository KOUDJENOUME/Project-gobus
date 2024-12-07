const db = require('../config/db');
const bcrypt = require("bcrypt");

const mongoose = require('mongoose');
const { Schema } = mongoose;

const userSchema = new Schema({
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
        // @ts-ignore
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
    passwordResetToken: {  // Ajout du token de réinitialisation
        type: String,
    },
    passwordResetExpires: {  // Ajout de l'expiration du token
        type: Date,
    }
},{ timestamps: true });


// used while encrypting user entered password
userSchema.pre("save", async function() {
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

// used while signIn decrypt
userSchema.methods.comparePassword = async function(candidatePassword) {
    try {
        console.log('Stored password:', this.password);
        // Afficher le mot de passe envoyé par l'utilisateur
        console.log('Received password:', candidatePassword);
        // @ts-ignore

        const isMatch = await bcrypt.compare(candidatePassword, this.password);
        console.log('Password match:', isMatch); // Affiche si les mots de passe correspondent

        return isMatch;
    } catch (error) {
        throw error;
    }
};

const UserModel = db.model('user', userSchema);
module.exports = UserModel;
