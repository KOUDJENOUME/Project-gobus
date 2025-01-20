import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourFormat {
  final int hour;
  final int minute;
  final int second;

  HourFormat(this.hour, this.minute, this.second);

  @override
  String toString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

final Map<String,dynamic> ticket ={
  "id_ticket": 375845,
  "depart":"Bohicon",
  "arrive":"Ouidah",
  "date_depart":DateTime(2025,1,5).toString().split(' ')[0],
  "heure_depart": HourFormat(6, 0, 0),
  "nom_bus":"Baobab",
  "nombre_place":80,
  "numero_bus": 4,
  "montant": 3000,
};
class ModificationTicket extends StatefulWidget {
  const ModificationTicket({super.key});

  @override
  State<ModificationTicket> createState() => _ModificationTicketState();
}

class _ModificationTicketState extends State<ModificationTicket> {
  final  _formkey = GlobalKey<FormState>();
  final TextEditingController _departControlleur = TextEditingController(text: ticket["depart"]);
  final TextEditingController _arriveControlleur = TextEditingController(text: ticket["arrive"]);
  final TextEditingController _heureControlleur1 = TextEditingController(text: "${ticket["heure_depart"]}");
  final TextEditingController _heureControlleur2 = TextEditingController(text: "${ticket["heure_depart"]}");
  final TextEditingController _dateDepartControlleur = TextEditingController(text: "${ticket["date_depart"]}");
  final TextEditingController _nomBusControlleur = TextEditingController(text: "${ticket["nom_bus"]}");
  final TextEditingController _nombrePlaceControlleur = TextEditingController(text: "${ticket["nombre_place"]}");
  final TextEditingController _numeroBusControlleur = TextEditingController(text: "${ticket["numero_bus"]}");
  final TextEditingController _montantControlleur = TextEditingController(text: "${ticket["montant"]}");
  
  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 12,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF000000),
    fontWeight: FontWeight.w500,
    fontSize: 12.8,
    fontFamily: 'Montserrat',
  );

  void dispose1(){
    _heureControlleur1.dispose();
    super.dispose();
  }
  void dispose2(){
    _heureControlleur2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_back,
              size: 30,
              )
          ),
          title: Text(" \"#${ticket["id_ticket"]}\" ",
                  style: titleStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  )
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("De",style: titleStyle,),
                          SizedBox(
                            width: 170,
                            height: 45,
                            child: TextFormField(
                              controller: _departControlleur,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFD6D6D6),
                                hintText: 'Entrer le lieu de départ',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          ),
                          SizedBox(height: 5,),
                          Text("Heure de Départ",style: titleStyle,),
                          SizedBox(
                            width: 170,
                            height: 45,
                            child: TextFormField(
                              controller: _heureControlleur1,
                              readOnly: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFD6D6D6),
                                  hintText: "Choisissez l'heure de départ",
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: Color(0xFFDD4011),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide.none
                                  )
                              ),
                              onTap: () async{
                                TimeOfDay? temps = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()
                                );
                                if(temps != null){
                                  _heureControlleur1.text =
                                  "${temps.hour}:${temps.minute.toString().padLeft(2, "0")}";
                                }
                              },
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Choisissez une heure de départ";
                                }
                                return null;
                              },
                            ),
                          ),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Vers",style: titleStyle,),
                          SizedBox(
                            width: 170,
                            height: 45,
                            child: TextFormField(
                              controller: _arriveControlleur,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFD6D6D6),
                                  hintText: 'Entrer le lieu d\'arriver',
                                  border:OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide.none
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("Heure de d'Arrivée",style: titleStyle,),
                          SizedBox(
                            width: 170,
                            height: 45,
                            child: TextFormField(
                              controller: _heureControlleur2,
                              readOnly: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFD6D6D6),
                                  hintText: "Choisissez l'heure de départ",
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: Color(0xFFDD4011),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide.none
                                  )
                              ),
                              onTap: () async{
                                TimeOfDay? temps = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()
                                );
                                if(temps != null){
                                  setState(() {
                                    _heureControlleur2.text =
                                    "${temps.hour}:${temps.minute.toString().padLeft(2, "0")}";
                                  });
                                }
                              },
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Choisisser une heure d'arrivé";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("Date",style: titleStyle,),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: TextFormField(
                      controller: _dateDepartControlleur,
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFD6D6D6),
                          hintText: "Choisissez la date de départ",
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            size: 40,
                            color: Color(0xFFDD4011),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none
                          )
                      ),
                      onTap: () async{
                        DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030));
                        if(date != null){
                          setState(() {
                            _dateDepartControlleur.text =
                                DateFormat("dd/MM/yyyy").format(date);
                          });
                        }
                      },

                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Choisisser une date de départ";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Nom du Bus",style: titleStyle,),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: TextFormField(
                      controller: _nomBusControlleur,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD6D6D6),
                        hintText: 'Entrer nom du bus',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Entrer le nom du bus";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Nombre de passager",style: titleStyle,),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: TextFormField(
                      controller: _nombrePlaceControlleur,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD6D6D6),
                        hintText: 'Entrer le nom du bus',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Entrer le nom du bus";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Numéro du Bus",style: titleStyle,),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: TextFormField(
                      controller: _numeroBusControlleur,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD6D6D6),
                        hintText: 'Entrer le numéro du bus',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Entrer le numéro du bus";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Prix",style: titleStyle,),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: TextFormField(
                      controller: _montantControlleur,
                      style: TextStyle(color: Color(0xFFDD4011)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD6D6D6),
                        hintText: 'Entrer le prix du ticket',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'Entrer le prix du ticket';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child:ElevatedButton(
                        onPressed: (){
                          if(_formkey.currentState!.validate()){

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDD4011),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide.none
                          )
                        ),
                        child: Text("Modifier",
                            style: titleStyle.copyWith(fontSize: 18, color: Color(0xFFFFFFFF))
                        )
                    ) ,
                  )

                ],
              ),
            )
        )
      )
    );
  }
}
