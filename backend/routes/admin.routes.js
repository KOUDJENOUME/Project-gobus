const router = require("express").Router();
const UserController = require("../controller/user.controller");
const TrajetController = require("../controller/trajet.controller");
const UserServices = require("../services/user.service");
const roleAuth = require("../middlewares/roleAuth");

// Route pour accéder au tableau de bord de l'admin
router.get("/admin-dashboard", roleAuth(["admin"]), (req, res) => {
  res.send(
    "Bienvenue sur le tableau de bord admin. Vous pouvez gérer les trajets, les réservations, etc."
  );
});

// CRUD des trajets
router.post(
  "/admin/trajet",
  roleAuth(["admin"]),
  TrajetController.createTrajet
);

router.get(
  "/admin/trajet/:id",
  roleAuth(["admin"]),
  TrajetController.getTrajet
);

router.put(
  "/admin/trajet/:id",
  roleAuth(["admin"]),
  TrajetController.updateTrajet
);

router.delete(
  "/admin/trajet/:id",
  roleAuth(["admin"]),
  TrajetController.deleteTrajet
);

// Gestion des utilisateurs
router.post("/admin/block-user", roleAuth(["admin"]), UserController.blockUser);

router.post(
  "/admin/unblock-user",
  roleAuth(["admin"]),
  UserController.unblockUser
);

// Envoi de messages/notifications
router.post(
  "/admin/send-message",
  roleAuth(["admin"]),
  UserController.sendMessage
);

router.post(
  "/admin/send-notification",
  roleAuth(["admin"]),
  UserController.sendNotification
);

module.exports = router;
