import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/../page_de_redirection.dart'; // Assurez-vous d'importer Flutter pour le Snackbar

class AuthService {
  // Instance de GoogleSignIn pour réutilisation
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      // Tentative de connexion avec Google
      GoogleSignInAccount? gUser = await _googleSignIn.signIn();

      if (gUser == null) {
        // Si l'utilisateur annule la connexion, retourner null
        return null;
      }

      // Récupérer l'authentification de Google
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Créer un credential à partir de l'authentification
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Connexion avec FirebaseAuth
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Afficher un message de confirmation avec un SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentification réussie! Bienvenue ${userCredential.user?.displayName}')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SimplePage()), // Remplacez SimplePage par votre page cible
      );

      return userCredential.user;
    } catch (e) {
      // Gérer les erreurs (par exemple, échec de la connexion)
      print("Erreur lors de la connexion avec Google : $e");

      // Afficher un message d'erreur avec un SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la connexion avec Google')),
      );

      return null;
    }
  }

  // Méthode pour se déconnecter
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
