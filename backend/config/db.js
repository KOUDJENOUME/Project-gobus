const mongoose = require("mongoose");
require("dotenv").config(); // Charger les variables d'environnement

const connectDB = async () => {
  try {
    // Récupérer l'URL de connexion depuis les variables d'environnement
    const mongoURI = process.env.MONGO_URI;

    // Connexion à MongoDB sans les options obsolètes
    await mongoose.connect(mongoURI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });

    console.log("Connexion à MongoDB réussie");
  } catch (err) {
    console.error("Erreur de connexion à MongoDB:", err.message);
    process.exit(1); // Arrêter le processus en cas d'erreur de connexion
  }
};

connectDB();
