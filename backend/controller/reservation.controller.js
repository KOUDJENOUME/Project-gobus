const TrajetModel = require("../models/trajet.model");
const ReservationModel = require("../models/reservation.model");

exports.reserverBillet = async (req, res, next) => {
  try {
    const { userId, trajetId, nombreDePlaces } = req.body;

    // Vérification de l'existence du trajet
    const trajet = await TrajetModel.findById(trajetId);
    if (!trajet) {
      return res.status(404).json({ message: "Trajet non trouvé" });
    }

    // Vérification du nombre de places disponibles
    if (trajet.nombreDePlaces < nombreDePlaces) {
      return res.status(400).json({ message: "Nombre de places insuffisant" });
    }

    // Réduire le nombre de places disponibles
    trajet.nombreDePlaces -= nombreDePlaces;
    await trajet.save();

    // Calcul du tarif total (tarif unitaire * nombre de places)
    const tarifTotal = trajet.tarif * nombreDePlaces;

    // Créer l'enregistrement de réservation
    const reservation = new ReservationModel({
      userId,
      trajetId,
      nombreDePlacesReservees: nombreDePlaces,
      numeroBus: trajet.numeroBus,
      tarif: tarifTotal,
      status: "Confirmée",
    });
    await reservation.save();

    res
      .status(201)
      .json({ message: "Réservation effectuée avec succès", reservation });
  } catch (error) {
    next(error);
  }
};

exports.annulerReservation = async (req, res, next) => {
  try {
    const { reservationId } = req.params;

    // Rechercher la réservation
    const reservation = await ReservationModel.findById(reservationId);
    if (!reservation) {
      return res.status(404).json({ message: "Réservation non trouvée" });
    }

    // Récupérer le trajet lié à cette réservation
    const trajet = await TrajetModel.findById(reservation.trajetId);
    if (!trajet) {
      return res.status(404).json({ message: "Trajet associé non trouvé" });
    }

    // Restaurer le nombre de places disponibles
    trajet.nombreDePlaces += reservation.nombreDePlacesReservees;
    await trajet.save();

    // Supprimer la réservation
    await ReservationModel.findByIdAndDelete(reservationId);

    res.status(200).json({ message: "Réservation annulée avec succès" });
  } catch (error) {
    next(error);
  }
};
