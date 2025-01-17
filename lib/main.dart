import 'package:flutter/material.dart';
import 'paiement.dart';

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat', // Définit la police par défaut
      ),
      home: PaymentScreen(),
    );
  }
}
