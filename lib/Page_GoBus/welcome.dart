import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF192A41), // Couleur de fond bleu foncé
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(), // Espace flexible en haut
              Text(
                "Bienvenue.\nRéservez vos tickets\nde Bus en toute simplicité !",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFDD4011), // Couleur orange
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),


              SizedBox(height: 35), // Espacement
              Text(
                "Planifiez votre voyage facilement grâce à notre interface intuitive et conviviale. Choisissez vos destinations, comparez les prix et réservez vos billets en quelques secondes.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'
                ),
              ),
              SizedBox(height: 95),// Espace flexible en bas
              ElevatedButton(
                onPressed: () {
                  // Action lors du clic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDD4011), // Couleur orange
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Commencer",
                      textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Montserrat'
                  ),
                ),
                    SizedBox(width: 30), SizedBox(height: 20),
                    Icon(Icons.arrow_forward, size: 30, color: Colors.white, weight: 50,),
                     ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}