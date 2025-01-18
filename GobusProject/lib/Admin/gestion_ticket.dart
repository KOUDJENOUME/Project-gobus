import 'package:flutter/material.dart';
  final List<Map<String, dynamic>> ticketDispo = [
    {
      "id_ticket": 375845,
      "depart":"Abomey-Calavi",
      "arrive":"Bohicon",
      "date_complet":"Lundi 16 Decembre 2024",
      "statut": 'En cours',
    },
    {
      "id_ticket": 375845,
      "depart":"Dassa",
      "arrive":"Bohicon",
      "date_complet":"Lundi 16 Decembre 2024",
      "statut": 'Non démarré',
    },
    {
      "id_ticket": 375845,
      "depart":"Dassa",
      "arrive":"Banikoara",
      "date_complet":"Lundi 16 Decembre 2024",
      "statut": 'Terminé',
    },
    {
      "id_ticket": 375845,
      "depart":"Abomey-Calavi",
      "arrive":"Bohicon",
      "date_complet":"Lundi 16 Decembre 2024",
      "statut": 'En cours',
    },
    {
      "id_ticket": 375845,
      "depart":"Dassa",
      "arrive":"Bohicon",
      "date_complet":"Lundi 16 Decembre 2024",
      "statut": 'Non démarré',
    },
    {
      "id_ticket": 375845,
      "depart":"Dassa",
      "arrive":"Banikoara",
      "date_complet":"Lundi 16 Decembre 2024",
      "statut": 'Terminé',
    },
  ];

  void RechercheId(String id){

  }
class GestionTicket extends StatefulWidget {
  const GestionTicket({super.key});

  @override
  State<GestionTicket> createState() => _GestionTicketState();
}

class _GestionTicketState extends State<GestionTicket> {
  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF000000),
    fontSize: 12.5,
    fontFamily: 'Montserrat',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Gerez les tickets',
          style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          fontFamily: 'Montserrat',
          ),
        )
      ),
      body: ticketDispo.isEmpty?
      Center(
        child: Text('Pas de ticket disponible',
          style: TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.w500,
            fontSize: 12.8,
            fontFamily: 'Montserrat',),),
      ):
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Card(
                  color: Color(0xFF192A41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none,

                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child:SizedBox(
                        width: double.infinity,
                        child: RichText(
                            text: TextSpan(
                                text: 'Modifier ',
                                style: titleStyle.copyWith(color: Color(0xFFDD4011)),
                                children: [
                                  TextSpan(
                                    text: 'et ',
                                    style:titleStyle.copyWith(color: Color(0xFFFFFFFF)),
                                  ),
                                  TextSpan(
                                    text: 'supprimer ',
                                  ),
                                  TextSpan(
                                    text: 'des réservations de l\'application',
                                    style:titleStyle.copyWith(color: Color(0xFFFFFFFF)) ,
                                  )
                                ]
                            )
                        ),
                      )
                  )
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search,
                    size: 40,
                  ),
                  SizedBox(
                    height: 42,
                    width: 330,
                    child: SearchBar(
                      hintText: "Ex: #2456789",
                      hintStyle: WidgetStatePropertyAll(name.copyWith(fontSize: 12)),
                      backgroundColor: WidgetStatePropertyAll(Colors.grey[350]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Column(
                children: List.generate(
                  ticketDispo.length,
                  (index){
                    final ticket = ticketDispo[index];
                    return Card(
                      elevation: 1,
                      color: Colors.grey[350],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${ticket["depart"]} - ${ticket["arrive"]}",
                                  style: TextStyle(
                                    color: Color(0xFF192A41),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Text(
                                  "#${ticket["id_ticket"]}",
                                  style: TextStyle(
                                    color: Color(0xFF192A41),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ticket["date_complet"],
                              style: TextStyle(color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.8,
                                fontFamily: 'Montserrat',),
                            ),
                            const Divider(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Status:",style: name.copyWith(fontSize: 16),),
                                Text("${ticket["statut"]}",style: titleStyle.copyWith(color: Color(0xFFDD4011), fontSize: 15),)
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: 10,
                              children: [
                                SizedBox(
                                  width:112,
                                  height: 28,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                              side: BorderSide(width: 1,color: Color(0xFFDD4011))
                                          )
                                      ),
                                      onPressed: (){}, child:
                                  Text("Modifier",style: titleStyle.copyWith(fontSize: 14),)
                                  ),
                                ),
                                SizedBox(
                                  width:130,
                                  height: 28,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFDD4011),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                              side: BorderSide(width: 1,color: Color(0xFFDD4011))
                                          )
                                      ),
                                      onPressed: (){}, child:
                                  Text("Confirmer",style: titleStyle.copyWith(fontSize: 14,color: Color(0xFFFFFFFF)),)
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      )
    ),
    );
  }
}
