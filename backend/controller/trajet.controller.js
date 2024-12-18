const TrajetModel = require("../models/trajet.model");

// 1. Créer un trajet
exports.createTrajet = async (req, res, next) => {
  try {
    const {
      numeroBus,
      destination,
      depart,
      date,
      nombreDePlaces,
      tarif,
      conducteur,
    } = req.body;

    const newTrajet = new TrajetModel({
      numeroBus,
      destination,
      depart,
      date,
      nombreDePlaces,
      tarif,
      conducteur,
    });

    await newTrajet.save();

    res.status(201).json({
      status: true,
      message: "Trajet créé avec succès",
      trajet: newTrajet,
    });
  } catch (error) {
    next(error);
  }
};

// 2. Obtenir tous les trajets
exports.getAllTrajets = async (req, res, next) => {
  try {
    const trajets = await TrajetModel.find();

    res.status(200).json({
      status: true,
      trajets,
    });
  } catch (error) {
    next(error);
  }
};

// 3. Obtenir un trajet par ID
exports.getTrajetById = async (req, res, next) => {
  try {
    const trajet = await TrajetModel.findById(req.params.id);

    if (!trajet) {
      return res
        .status(404)
        .json({ status: false, message: "Trajet non trouvé" });
    }

    res.status(200).json({
      status: true,
      trajet,
    });
  } catch (error) {
    next(error);
  }
};

// 4. Mettre à jour un trajet
exports.updateTrajet = async (req, res, next) => {
  try {
    const {
      numeroBus,
      destination,
      depart,
      date,
      nombreDePlaces,
      tarif,
      conducteur,
    } = req.body;

    const updatedTrajet = await TrajetModel.findByIdAndUpdate(
      req.params.id,
      {
        numeroBus,
        destination,
        depart,
        date,
        nombreDePlaces,
        tarif,
        conducteur,
      },
      { new: true }
    );

    if (!updatedTrajet) {
      return res
        .status(404)
        .json({ status: false, message: "Trajet non trouvé" });
    }

    res.status(200).json({
      status: true,
      message: "Trajet mis à jour avec succès",
      trajet: updatedTrajet,
    });
  } catch (error) {
    next(error);
  }
};

// 5. Supprimer un trajet
exports.deleteTrajet = async (req, res, next) => {
  try {
    const trajet = await TrajetModel.findByIdAndDelete(req.params.id);

    if (!trajet) {
      return res
        .status(404)
        .json({ status: false, message: "Trajet non trouvé" });
    }

    res.status(200).json({
      status: true,
      message: "Trajet supprimé avec succès",
    });
  } catch (error) {
    next(error);
  }
};
