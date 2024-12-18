const router = require("express").Router();
const TrajetController = require("../controller/trajet.controller");
const roleAuth = require("../middlewares/roleAuth");

// Routes pour la gestion des trajets (pour l'admin)
router.post(
  "/admin/trajet",
  roleAuth(["admin"]),
  TrajetController.createTrajet
); // Créer un trajet

router.get(
  "/admin/trajets",
  roleAuth(["admin"]),
  TrajetController.getAllTrajets
); // Obtenir tous les trajets

router.get(
  "/admin/trajet/:id",
  roleAuth(["admin"]),
  TrajetController.getTrajetById
); // Obtenir un trajet par ID

router.put(
  "/admin/trajet/:id",
  roleAuth(["admin"]),
  TrajetController.updateTrajet
); // Mettre à jour un trajet

router.delete(
  "/admin/trajet/:id",
  roleAuth(["admin"]),
  TrajetController.deleteTrajet
); // Supprimer un trajet

module.exports = router;
