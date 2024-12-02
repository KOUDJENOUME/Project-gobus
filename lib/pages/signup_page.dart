import 'package:flutter/material.dart';
import 'package:gobus/data/services/user_service.dart';
import 'package:gobus/pages/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:gobus/data/models/user.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  final userService = UserService();

  createUser() async {
    setState(() {
      loading = true;
    });

    try {
      // Collecte des données du formulaire
      Map<String, dynamic> data = {
        'email': emailController.text,
        'fullname': fullnameController.text,
        'password': passwordController.text,
      };

      // Appel à la méthode create de UserService
      await userService.create(data);

      // Réinitialiser les champs après la création de l'utilisateur
      passwordController.text = "";
      fullnameController.text = "";
      emailController.text = "";

      // Message de succès
      Fluttertoast.showToast(msg: "Utilisateur créé avec succès");
    } on DioException catch (e) {
      // Gestion des erreurs spécifiques Dio
      if (e.response != null) {
        // Affichage des détails de l'erreur serveur
        print('Erreur du serveur: ${e.response?.data}');
        print('Code de statut: ${e.response?.statusCode}');
        Fluttertoast.showToast(msg: "Erreur serveur: ${e.response?.statusCode}");
      } else {
        // Affichage de l'erreur de la requête ou de la connexion
        print('Erreur de la requête: ${e.requestOptions}');
        print('Message d\'erreur: ${e.message}');

        // Vérification des types d'erreurs spécifiques
        if (e.type == DioExceptionType.connectionTimeout) {
          Fluttertoast.showToast(msg: "Le serveur ne répond pas. Vérifiez votre connexion.");
        } else if (e.type == DioExceptionType.receiveTimeout) {
          Fluttertoast.showToast(msg: "Le serveur prend trop de temps à répondre.");
        } else if (e.type == DioExceptionType.sendTimeout) {
          Fluttertoast.showToast(msg: "Le serveur prend trop de temps pour envoyer la requête.");
        } else {
          Fluttertoast.showToast(msg: "Une erreur est survenue. Veuillez réessayer.");
        }
      }
    } catch (e) {
      // Gestion des autres erreurs génériques
      print('Erreur inattendue: $e');
      Fluttertoast.showToast(msg: "Une erreur inattendue est survenue.");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Créer un compte",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                // Champ Email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    label: Text("Email *"),
                    hintText: "Entrez votre email",
                  ),
                  validator: (String? value) {
                    return value == null || value.isEmpty ? "Ce champ est obligatoire" : null;
                  },
                ),
                // Champ Nom & Prénom
                TextFormField(
                  controller: fullnameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    label: Text("Nom & Prénom *"),
                    hintText: "Entrez votre nom et prénom",
                  ),
                  validator: (String? value) {
                    return value == null || value.isEmpty ? "Ce champ est obligatoire" : null;
                  },
                ),
                // Champ Mot de passe
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    label: Text("Mot de passe *"),
                    hintText: "Entrez votre mot de passe",
                  ),
                  validator: (String? value) {
                    return value == null || value.isEmpty ? "Ce champ est obligatoire" : null;
                  },
                ),
                SizedBox(height: 20),
                // Bouton de création d'utilisateur
                ElevatedButton(
                  onPressed: () async {
                    if (!loading) {
                      if (formkey.currentState!.validate()) {
                        await createUser();
                      }
                    }
                  },
                  child: loading
                      ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  )
                      : Text(
                    "Créer",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          // Lien vers la page de connexion
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                "Connectez-vous",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
