// Middleware pour vérifier les rôles d'utilisateur.

const jwt = require("jsonwebtoken");
const UserModel = require("../models/user.model");

module.exports = function (requiredRoles) {
  return async (req, res, next) => {
    try {
      const token = req.headers.authorization?.split(" ")[1];
      if (!token) {
        return res.status(401).json({ message: "Unauthorized" });
      }

      const decoded = jwt.verify(token, process.env.JWT_SECRET_KEY);
      const user = await UserModel.findById(decoded._id);

      if (!user) {
        return res.status(401).json({ message: "User not found" });
      }

      if (!requiredRoles.includes(user.role)) {
        return res.status(403).json({ message: "Access denied" });
      }

      req.user = user; // Ajout de l'utilisateur à la requête pour un accès ultérieur
      next();
    } catch (err) {
      res.status(403).json({ message: "Invalid token" });
    }
  };
};
