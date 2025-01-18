import 'package:flutter/material.dart';

class HeureFormat {
  final int hour;
  final int minute;
  final int second;

  HeureFormat(this.hour, this.minute, this.second);

  @override
  String toString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

final List<Map<String, dynamic>> notificationInfo = [
  {
    "nom_reserveur": "GOUDOU",
    "prenom_reserveur": "Edward",
    "id_ticket": 375848,
    "depart":"Cotonou",
    "arrive":"Bohicon",
    "heure_reservation": HeureFormat(17, 20, 0),
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_reserveur": "DOE",
    "prenom_reserveur": "John",
    "id_ticket": 375848,
    "depart":"Porto-Novo",
    "arrive":"Bohicon",
    "heure_reservation": HeureFormat(17, 20, 0),
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_reserveur": "WILSON",
    "prenom_reserveur": "Edward",
    "id_ticket": 375849,
    "depart":"Dassa",
    "arrive":"Bohicon",
    "heure_reservation": HeureFormat(17, 20, 0),
    "montant":4000,
    "devise":"XOF"
  },
  {
    "nom_reserveur": "CASSI",
    "prenom_reserveur": "Cassis",
    "id_ticket": 375849,
    "depart":"Dassa",
    "arrive":"Parakou",
    "heure_reservation": HeureFormat(17, 20, 0),
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_reserveur": "WILSON",
    "prenom_reserveur": "Edward",
    "id_ticket": 375849,
    "depart":"Dassa",
    "arrive":"Bohicon",
    "heure_reservation": HeureFormat(17, 20, 0),
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_reserveur": "BANGER",
    "prenom_reserveur": "Chris",
    "id_ticket": 375849,
    "depart":"Dassa",
    "arrive":"Bohicon",
    "heure_reservation": HeureFormat(17, 20, 0),
    "montant":4000,
    "devise":"XOF"
  }
];

class NotificationReservation extends StatefulWidget {
  const NotificationReservation({super.key});

  @override
  State<NotificationReservation> createState() => _NotificationReservationState();
}

class _NotificationReservationState extends State<NotificationReservation> {
  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 15,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF000000),
    fontWeight: FontWeight.w500,
    fontSize: 13.6,
    fontFamily: 'Montserrat',
  );

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
            title: const Text(
              "Notifications",
              style: TextStyle(fontWeight: FontWeight.w700,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
            centerTitle: true,
          ),
          body: notificationInfo.isEmpty? Center(
            child: Text('Pas de notification',style: titleStyle,),
          ):
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            child:
              Expanded(
                child:ListView.builder(
                  itemCount: notificationInfo.length,
                  itemBuilder: (context,index){
                    final info = notificationInfo[index];
                    return Card(
                      elevation: 1,
                      color: Colors.grey[350],
                      margin: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide.none
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 1,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Nouvelle reservation',style: titleStyle,),
                                    Icon(Icons.check_circle,size:15,color: Color(0xFFDD4011),)
                                  ],
                                ),
                                Text("${info["depart"]} --> ${info["arrive"]}",style: name,),
                                Text("${info["prenom_reserveur"]} ${info["nom_reserveur"]}",style: name,)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 1,
                              children: [
                                Text("${info["heure_reservation"]}",style: name,),
                                Text("${info["montant"]} ${info["devise"]}",style: titleStyle,),
                                Text("${info["id_ticket"]}",style: titleStyle,),
                                SizedBox(
                                  height: 14,
                                  child: TextButton.icon(
                                    onPressed: (){},
                                    icon: Text("Voir les détails",
                                      style: name.copyWith(fontSize: 12, color: Color(0xFFDD4011)),
                                    ),
                                    label: Icon(Icons.arrow_forward_ios,
                                      size: 12.5,
                                      color: Color(0xFFDD4011),
                                    ),
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical:1 )
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    );
                  },
                ),
              )

          ),
        )
    );
  }
}
