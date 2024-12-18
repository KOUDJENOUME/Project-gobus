const mongoose = require("mongoose");
const { Schema } = mongoose;

const reservationSchema = new Schema(
  {
    userId: {
      type: Schema.Types.ObjectId,
      ref: "user",
      required: true,
    },
    trajetId: {
      type: Schema.Types.ObjectId,
      ref: "trajet",
      required: true,
    },
    numeroBus: {
      type: String,
      required: true,
    },
    tarif: {
      type: Number,
      required: true,
    },
    dateReservation: {
      type: Date,
      default: Date.now,
    },
    status: {
      type: String,
      default: "En attente",
    },
  },
  { timestamps: true }
);

const ReservationModel = mongoose.model("Reservation", reservationSchema);
module.exports = ReservationModel;
