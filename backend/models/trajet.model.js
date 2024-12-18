const mongoose = require("mongoose");
const { Schema } = mongoose;

const trajetSchema = new Schema(
  {
    numeroBus: {
      type: String,
      required: true,
    },
    destination: {
      type: String,
      required: true,
    },
    depart: {
      type: String,
      required: true,
    },
    date: {
      type: Date,
      required: true,
    },
    nombreDePlaces: {
      type: Number,
      required: true,
      min: 0,
    },
    tarif: {
      type: Number,
      required: true,
    },
    conducteur: {
      type: String,
      required: true,
    },
  },
  { timestamps: true }
);

const TrajetModel = mongoose.model("Trajet", trajetSchema);

module.exports = TrajetModel;
