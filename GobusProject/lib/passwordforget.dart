import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'loginPage.dart'; // Pour encoder le corps de la requête

class Passforget extends StatefulWidget {
  @override
  _PassforgetState createState() => _PassforgetState();
}

class _PassforgetState extends State<Passforget> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false; // Pour afficher un indicateur de chargement si nécessaire

  // Fonction pour envoyer la requête au backend
  Future<void> _sendPasswordResetEmail() async {
    if (_emailController.text.isEmpty) {
      // Vérification si le champ email est vide
      _showDialog('Veuillez entrer un email.');
      return;
    }

    setState(() {
      _isLoading = true; // Afficher un indicateur de chargement
    });

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/forgot-password'), // Remplacez par l'URL de votre API
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': _emailController.text}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _showDialog(data['message']); // Affiche le message de succès ou d'erreur
      } else {
        _showDialog('Une erreur est survenue. Veuillez réessayer.');
      }
    } catch (error) {
      _showDialog('Erreur de connexion. Veuillez vérifier votre réseau.');
    } finally {
      setState(() {
        _isLoading = false; // Cacher l'indicateur de chargement
      });
    }
  }

  // Fonction pour afficher la boîte de dialogue
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réinitialisation du mot de passe'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Entrez votre email pour réinitialiser votre mot de passe',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _sendPasswordResetEmail, // Désactive le bouton pendant le chargement
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white) // Indicateur de chargement
                    : Text('Envoyer le lien de réinitialisation'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Naviguer vers la page de connexion
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                  },
                child: Text('Retour à la connexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
