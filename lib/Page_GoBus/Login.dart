import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  // Logo
                  Image.asset(
                    "assets/image/im2.png",
                    width: 180,
                    height: 110,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hello,\nConnectez-vous.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',

                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Email Field
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
            const SizedBox(height: 5),
            // Password Field
            SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.emailAddress,
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
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(color: Colors.black, fontFamily: 'Montserrat')
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Login Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Color(0xFF192A41),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child:Text(
                ("Se connecter"),
                  style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                    fontSize: 20,
                      fontFamily: 'Montserrat'
              ),
            ),
    ),SizedBox(height: 30),
            Text(
              "Ou continuez avec:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat'
              ),
            ),
            const SizedBox(height: 30),
            // Social Buttons
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
                    ),
                  ),
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
            const SizedBox(height: 60),
            // Register Link
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text.rich(
                  TextSpan(
                    text: "N’avez-vous pas de compte ? ",
                    style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                    children: [
                      TextSpan(
                        text: "S’inscrire.",
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
             ],
        ),
      ),
    );
  }
}