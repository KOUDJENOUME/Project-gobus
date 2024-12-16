const mongoose = require('mongoose');

// Connexion à MongoDB avec mongoose.connect() 
mongoose.connect('mongodb://127.0.0.1:27017/ToDoDB')
    .then(() => {
        console.log("MongoDB Connected");
    })
    .catch((err) => {
        console.log("MongoDB Connection error:", err);
    });

module.exports = mongoose;
