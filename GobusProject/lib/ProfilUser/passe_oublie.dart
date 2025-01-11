import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class PasseOublie extends StatefulWidget {
  const PasseOublie({super.key});

  @override
  State<PasseOublie> createState() => _PasseOublieState();
}

class _PasseOublieState extends State<PasseOublie> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                onPressed: (){},
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  weight: 700,),
              )
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Vérification par E-mail",
                    style: TextStyle(fontWeight: FontWeight.w600,
                      fontSize: 24,
                      fontFamily: 'Montserrat',),
                  ),
                  Text("Veuillez entrer le code à 4 chiffres qui \n vous a été envoyé par e-mail",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat'
                    ),),
                  const SizedBox(height: 50,),
                  OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 55,
                    fieldHeight: 75,
                    filled: true,
                    borderRadius: BorderRadius.circular(15),
                    fillColor: Color(0xFFD6D6D6),
                    focusedBorderColor: Color(0xFF192A41),
                    showFieldAsBox: true,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Vous n’avez reçu aucun code ? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text("Renvoyer",
                            style: TextStyle(fontSize: 18,color: Color(0xFF192A41)),
                          )
                      )
                    ],
                  ),

                  const SizedBox(height: 55,),
                  SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF192A41),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        onPressed: (){},
                        child: Text("Vérifier et continuer",
                          style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Montserrat'),
                        )
                    ),
                  )
                ],
              ),
            ),
          )
        )
    );
  }
}
