import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InscriptionPage(),
    );
  }
}

class InscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Action de retour
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 50),
              Text(
                "Inscription",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Montserrat',),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Nom",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: "Prénom",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat', // Spécifiez ici le nom de votre police
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Numéro de téléphone",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat', // Spécifiez ici le nom de votre police
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat', // Spécifiez ici le nom de votre police
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat', // Spécifiez ici le nom de votre police
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmer mot de passe",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat', // Spécifiez ici le nom de votre police
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  // Action d'inscription
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDD4011),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  "S'inscrire",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ou s'inscrire avec:",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/image/google.png', // Ajoutez l'icône Google.
                      height: 20,
                    ),
                    label: const Text("Google",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17
                      ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEFEFEF),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/image/facebook.png', // Ajoutez l'icône Facebook.
                      height: 20,
                    ),
                    label: const Text("Facebook",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEFEFEF),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 16),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 55),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text.rich(
                    TextSpan(
                      text: "Avez vous un compte  ? ",
                      style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                      children: [
                        TextSpan(
                          text: "Se connecter.",
                          style: TextStyle(
                              color: Color(0xFFDD4011),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      )
    );
  }
}