const router = require("express").Router();
const ReservationController = require("../controller/reservation.controller");

// Route pour réserver un billet
router.post("/reserver", ReservationController.reserverBillet);

// Route pour annuler un billet réserver un billet
router.delete(
  "/annuler/:reservationId",
  ReservationController.annulerReservation
);

module.exports = router;
