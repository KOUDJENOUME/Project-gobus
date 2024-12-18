const jwt = require("jsonwebtoken");
const User = require("../models/user.model");

// Middleware pour vérifier si l'utilisateur est admin
const isAdmin = async (req, res, next) => {
  try {
    // Récupération du token d'authentification dans les headers
    const token = req.headers.authorization?.split(" ")[1]; // Bearer token

    if (!token) {
      return res.status(401).json({ message: "Token non fourni" });
    }

    // Vérification du token JWT
    const decoded = jwt.verify(token, process.env.JWT_SECRET_KEY);
    const user = await User.findById(decoded.userId);

    if (!user) {
      return res.status(404).json({ message: "Utilisateur non trouvé" });
    }

    // Vérification si l'utilisateur a un rôle 'admin'
    if (user.role !== "admin") {
      return res
        .status(403)
        .json({ message: "Accès refusé, vous devez être administrateur" });
    }

    // Si l'utilisateur est admin, on passe à la suite de la requête
    next();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erreur interne du serveur" });
  }
};

module.exports = isAdmin;
