import 'package:flutter/material.dart';

class AjoutTicket extends StatefulWidget {
  const AjoutTicket({super.key});

  @override
  State<AjoutTicket> createState() => _AjoutTicketState();
}

class _AjoutTicketState extends State<AjoutTicket> {
  final _formeKey = GlobalKey<FormState>();
  final TextEditingController _heureControleur1 = TextEditingController();
  final TextEditingController _heureControleur2 = TextEditingController();
  final TextEditingController _nomBusControleur = TextEditingController();
  final TextEditingController _passagerControleur = TextEditingController();
  final TextEditingController _prixControleur = TextEditingController();

  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF192A41),
    fontSize: 12.5,
    fontFamily: 'Montserrat',
  );

  void dispose1(){
    _heureControleur1.dispose();
    super.dispose();
  }

  void dispose2(){
    _heureControleur2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            fontFamily: 'Montserrat',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, size: 24,),
            onPressed: () {},
          ),
        ]
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xFF192A41),
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          width: double.infinity,
                          child: RichText(
                            text: TextSpan(
                                text: 'Ajoutez',
                                style:titleStyle.copyWith(color: Color(0xFFDD4011)),
                                children: [
                                  TextSpan(
                                      text: ' des nouveaux \n tickets a l’application',
                                      style:titleStyle.copyWith(color: Color(0xFFFFFFFF))
                                  ),
                                ]
                            ),
                          ),
                        )
                    )
                ),
                SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: Colors.grey[350],
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                    child: Form(
                      key: _formeKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("De",
                                    style: name,
                                  ),
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 140,
                                      height: 35,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFFFFFFF),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide.none
                                            )
                                        ),
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return "Entrer le nom de la ville de départ";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text("Aller", style: name,),
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(10),
                                    child:SizedBox(
                                      width: 140,
                                      height: 35,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFFFFFFF),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none
                                          ),
                                        ),
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return "Entrer le nom de la ville de départ";
                                          }
                                          return null;
                                        },
                                      ),
                                    ) ,
                                  ),
                                  SizedBox(height: 8,),
                                  Text("Heure de départ",style: name,),
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 140,
                                      height: 35,
                                      child: TextFormField(
                                        controller: _heureControleur1,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none
                                          ),
                                          suffixIcon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFFDD4011),
                                            size: 40,
                                          ),
                                        ),
                                        onTap: () async {
                                          TimeOfDay? temps = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now()
                                          );
                                          if(temps != null){
                                            setState((){
                                              _heureControleur1.text =
                                              "${temps.hour}:${temps.minute.toString().padLeft(2, "0")}";
                                            }
                                            );
                                          }
                                        },
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return "Veuiller entrer une heure de départ";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Vers",
                                    style: name,
                                  ),
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 140,
                                      height: 35,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFFFFFFF),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide.none
                                            )
                                        ),
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return "Entrer la date de retour";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text("Retour", style: name,),
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(10),
                                    child:SizedBox(
                                      width: 140,
                                      height: 35,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFFFFFFF),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none
                                          ),
                                        ),
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return "Entrer la date de retour";
                                          }
                                          return null;
                                        },
                                      ),
                                    ) ,
                                  ),
                                  SizedBox(height: 8,),
                                  Text("Heure d'arrivée", style: name,),
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 140,
                                      height: 35,
                                      child: TextFormField(
                                        controller: _heureControleur2,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFFFFFFF),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide.none
                                            ),
                                            suffixIcon: Icon(
                                              Icons.arrow_drop_down,
                                              size: 40,
                                              color: Color(0xFFDD4011),
                                            )
                                        ),
                                        onTap: () async{
                                          TimeOfDay? temps = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now()
                                          );
                                          if(temps != null){
                                            setState(() {
                                              _heureControleur2.text =
                                              "${temps.hour}:${temps.minute.toString().padLeft(2,"0")}";
                                            });
                                          }
                                        },
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return "Entrer une Heure d'arrivée";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text("Nom du Bus",style: name,),
                          Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _nomBusControleur,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Entrez le nom du Bus";
                                    }
                                    return null;
                                  },
                                ),
                              )
                          ),
                          SizedBox(height: 10,),
                          Text("Passagers",style: name,),
                          Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _passagerControleur,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Entrez le nombre de passagers";
                                    }
                                    return null;
                                  },
                                ),
                              )
                          ),
                          SizedBox(height: 10,),
                          Text("Prix",style: name,),
                          Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _prixControleur,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none
                                    ),

                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Entrez le prix du ticket";
                                    }
                                    return null;
                                  },
                                ),
                              )
                          ),
                          Center(
                            child: Transform.translate(
                              offset: Offset(0, 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(width: 1, color: Color(0xFFDD4011))
                                    ),
                                    padding:EdgeInsets.symmetric(horizontal: 28,vertical: 8),
                                  ),
                                  onPressed: (){
                                    if(_formeKey.currentState!.validate()){

                                    }
                                  },
                                  child: Text('Ajouter',
                                      style: titleStyle.copyWith(fontSize: 18,)
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
