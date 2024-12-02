import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gobus/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
