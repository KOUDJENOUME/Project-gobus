import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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
          body: Padding(
              padding:EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mot de passe oublié ?",
                  style:TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 5,),
                Text("Veuillez saisir votre adresse E-mail,\n et nous vous enverrons les instructions\n nécessaires à la réinitialisation de\n votre mot de passe.",
                  style: TextStyle(fontSize: 15,
                      fontFamily: 'Montserrat'),
                ),
                const SizedBox(height: 50,),
                Form(child: Column(
                  children: [
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          prefixIconColor: Color(0xFF192A41),
                          filled: true,
                          fillColor: Colors.grey[300],
                          hintText: "karelhans@amen.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    const SizedBox(height: 60,),
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
                          child: Text("Réinitialiser mot de passe",style: TextStyle(
                              color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat'
                      ),)
                      ),
                    )
                  ],
                ))
            ],
          ),
          ),
        )
    );
  }
}
