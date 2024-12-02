import 'package:flutter/material.dart';
import 'package:gobus/data/models/authenticated_user.dart';
import 'package:gobus/data/services/auth_service.dart';
import 'package:gobus/data/services/user_service.dart';
import 'package:gobus/pages/page_de_redirection.dart';
import 'package:gobus/pages/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Définition du widget SquareTile
class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTile({
    super.key,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool loading = false;

  // Initialiser la classe du service utilisateur
  final userService = UserService();

  loginUser() async {
    // Déclencher le loading
    setState(() {
      loading = true;
    });

    if (formkey.currentState?.validate() ?? false) {
      try {
        // Préparer les données à envoyer
        Map<String, dynamic> data = {
          'email': emailController.text,
          'strategy': 'local',
          'password': passwordController.text
        };

        // Lancer la requête
        AuthenticatedUser authUser = await userService.login(data);

        // Initialiser une instance de shared preferences
        final sharedPref = await SharedPreferences.getInstance();

        // Sauvegarder le token en mémoire
        sharedPref.setString("token", authUser.accessToken!);

        // Afficher un message de succès
        Fluttertoast.showToast(msg: "Utilisateur connecté avec succès");

        // Rediriger vers la page SignupPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SimplePage(),
          ),
        );

      } on DioException catch (e) {
        // Afficher les erreurs de requête et le code de statut
        if (e.response != null) {
          print(e.response?.data);
          print(e.response?.statusCode);
          Fluttertoast.showToast(msg: "Erreur : ${e.response?.data['message'] ?? 'Erreur inconnue'}");
        } else {
          // Erreur lors de l'envoi de la requête
          print(e.requestOptions);
          print(e.message);
          Fluttertoast.showToast(msg: "Erreur réseau : ${e.message}");
        }
      } finally {
        setState(() {
          loading = false;
        });
      }
    } else {
      Fluttertoast.showToast(msg: "Veuillez remplir tous les champs obligatoires.");
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
            "Se connecter",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
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
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
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
                ElevatedButton(
                  onPressed: () async {
                    if (!loading) {
                      await loginUser();
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
                      : Text("Connexion", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(
                onTap: () => AuthService().signInWithGoogle(context),
                imagePath: 'assets/images/google.png',

              ),
              SizedBox(width: 25),

            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text("Créer un compte", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
