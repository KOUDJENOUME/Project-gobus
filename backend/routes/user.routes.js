const router = require("express").Router();
const UserController = require('../controller/user.controller');

// Routes existantes
router.post("/register", UserController.register);
router.post("/login", UserController.login);

// Routes ajoutées pour la fonctionnalité "Mot de passe oublié"
router.post("/forgot-password", UserController.forgotPassword);
router.post("/reset-password/:token", UserController.resetPassword);
// Route GET pour afficher le formulaire de réinitialisation de mot de passe
router.get("/reset-password/:token", (req, res) => {
    const token = req.params.token;
    // Vous pouvez ici rendre un template HTML pour saisir le nouveau mot de passe
    // Exemple : res.render('reset-password', { token: token });
    res.render("reset-password", { token: token });
});
// Route GET pour afficher le formulaire de réinitialisation de mot de passe
// Route POST pour gérer la soumission du formulaire
router.post("/reset-password/:token", (req, res) => {
    const { password, confirmPassword } = req.body;
    const token = req.params.token;

    // Vérification des mots de passe et traitement du token
    if (password !== confirmPassword) {
        return res.status(400).send("Les mots de passe ne correspondent pas.");
    }

    // Logique pour réinitialiser le mot de passe en utilisant le token
    UserServices.resetPasswordWithToken(token, password)
        .then(() => {
            res.send("Mot de passe réinitialisé avec succès !");
        })
        .catch((error) => {
            res.status(500).send("Erreur lors de la réinitialisation du mot de passe.");
        });
});



module.exports = router;
