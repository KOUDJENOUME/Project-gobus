import 'package:flutter/material.dart';
import 'notifications.dart'; // Importez la page Notifications

class PaiementReussiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigation vers NotificationScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFDD4011),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Paiement réussi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Votre paiement a été effectué avec succès.\n'
                'Vous pouvez cependant vérifier vos ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              GestureDetector(
                onTap: () {
                  // Redirection vers les détails de réservation
                },
                child: Text(
                  'détails de réservation.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFDD4011),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
