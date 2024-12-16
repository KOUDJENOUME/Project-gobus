const admin = require('firebase-admin'); // Pour vérifier le token Firebase
const User = require('../models/User'); // Assurez-vous que le modèle User est bien importé

// Cette fonction est appelée pour enregistrer ou authentifier un utilisateur via Google
const registerOrLoginWithGoogle = async (req, res) => {
  const { idToken } = req.body; // Token Firebase envoyé depuis l'application Flutter
  if (!idToken) {
    return res.status(400).json({ message: 'Token manquant' });
  }

  try {
    // Vérifier le token Firebase
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    const { uid, email, name } = decodedToken; // Extraire les informations du token

    // Vérifier si l'utilisateur existe déjà dans la base de données
    let user = await User.findOne({ email });

    if (!user) {
      // Si l'utilisateur n'existe pas, enregistrez-le dans MongoDB
      const [firstName, lastName] = name.split(' '); // Séparer le nom complet en prénom et nom

      user = new User({
        email,
        nom: lastName, // Utiliser 'nom' pour le dernier nom
        prenom: firstName, // Utiliser 'prenom' pour le prénom
        password: '', // Le mot de passe n'est pas requis pour les utilisateurs Google
        modeDePaiement: 'Non défini', // Valeur par défaut, peut être mise à jour plus tard
        preferencesDeNotification: 'Non définies', // Valeur par défaut, peut être mise à jour plus tard
      });

      // Sauvegarder l'utilisateur dans la base de données
      await user.save();
    }

    // Retourner l'utilisateur authentifié
    res.status(200).json({
      success: true,
      message: 'Utilisateur authentifié ou créé avec succès',
      user: {
        email: user.email,
        nom: user.nom,
        prenom: user.prenom,
      },
    });
  } catch (error) {
    console.error('Erreur lors de l\'authentification Google :', error);
    res.status(500).json({ message: 'Erreur serveur' });
  }
};

// Route pour l'enregistrement ou la connexion de l'utilisateur Google
app.post('/auth/google', registerOrLoginWithGoogle);
