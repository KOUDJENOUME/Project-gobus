import 'package:flutter/material.dart';
import 'loginPage.dart'; // Assurez-vous que ce fichier contient la définition de SignInPage.
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialisation de Firebase
  await FirebaseAuth.instance.setLanguageCode('fr'); // Utilisez 'fr' ou la locale que vous souhaitez

  // Capturer toutes les erreurs non gérées
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Log l'erreur dans la console
    print(details.toString());

  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInPage(), // Redirige directement vers la page de connexion
    );
  }
}
