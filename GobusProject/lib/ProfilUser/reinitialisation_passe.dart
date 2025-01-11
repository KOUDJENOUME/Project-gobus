import 'package:flutter/material.dart';

class ReinitialisationPasse extends StatefulWidget {
  const ReinitialisationPasse({super.key});

  @override
  State<ReinitialisationPasse> createState() => _ReinitialisationPasseState();
}

class _ReinitialisationPasseState extends State<ReinitialisationPasse> {
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
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Créer un nouveau mot de \n passe",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 25,),
                  Text("Votre nouveau mot de passe doit être \n différent de l’ancien.",
                    style: TextStyle(fontSize: 15,
                        fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(height: 25),
                  Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nouveau mot de passe",style: TextStyle(fontWeight: FontWeight.w500),),
                          SizedBox(height: 5,),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                filled: true,
                                fillColor: Colors.grey[350],
                                hintText: "................",
                                hintStyle:TextStyle(fontWeight: FontWeight.w700) ,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text("Confirmer mot de passe",style: TextStyle(fontWeight: FontWeight.w500),),
                          SizedBox(height: 5,),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                filled: true,
                                fillColor: Colors.grey[350],
                                hintText: "................",
                                hintStyle:TextStyle(fontWeight: FontWeight.w700) ,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                          ),
                          SizedBox(height: 50,),
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
                                child: Text("Continuer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat'),)
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          )
        )
    );
  }
}
