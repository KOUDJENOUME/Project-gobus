import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

Map<String, dynamic> ticketDetail = {
  "id_ticket": 375848,
  "nom_itineraire": "Abomey-Calavi-Bohicon",
  "date_complet": "Lundi 16 Decembre 2024",
  "numero_bus": 4,
  "numero_siege": 06,
  "nom_bus": "Baobab",
  "heure_depart": HourFormat(6, 0, 0),
  "heure_arrive": HourFormat(12, 0, 0),
  "montant": 2000,
  "devise": "XOF",
};

class DetailReservation extends StatefulWidget {
  const DetailReservation({super.key});

  @override
  State<DetailReservation> createState() => _DetailReservationState();
}

class _DetailReservationState extends State<DetailReservation> {
  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back,
              size: 30,
              weight: 700,
            ),
            title: Text('Détails de réservation',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25)),
            centerTitle: true,

          ),
          body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  color: Colors.grey[350],
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              ticketDetail["nom_itineraire"],
                              style: titleStyle,
                            ),
                            Text(ticketDetail["date_complet"])
                          ],
                        ),
                        TextButton.icon(
                            onPressed: (){},
                            label: const Icon(
                              Icons.share_outlined,
                              color: Color(0xFFDD4011),
                              size: 25,
                            )
                        )
                      ],
                    ),
                  )
                ),
                Card(
                  color: Colors.grey[350],
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nom du Bus"),
                                Text(
                                  ticketDetail["nom_bus"],
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("ID Ticket"),
                                Text(
                                  "${ticketDetail["id_ticket"]}",
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("Heure de Depart"),
                                Text(
                                  "${ticketDetail["heure_depart"]}",
                                  style: titleStyle,
                                ),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Numero de siege"),
                                Text(
                                  "${ticketDetail["numero_siege"]}",
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("Numero du bus"),
                                Text(
                                  "${ticketDetail["numero_bus"]}",
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("Heure d'Arrivée"),
                                Text(
                                  "${ticketDetail["heure_arrive"]}",
                                  style: titleStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                    ),
                ),
                Card(
                  color: Colors.grey[350],
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:',style: const TextStyle(fontSize: 15),),
                      Text(
                        "${ticketDetail['montant']} ${ticketDetail['devise']}",
                        style: titleStyle.copyWith(color: const Color(0xFFDD4011)),
                      )
                    ],
                  ),
                  )
                ),
                Card(
                  color: Colors.grey[350],
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        QrImageView(
                          data: '''
                            ID: ${ticketDetail["id_ticket"]}
                            Itinéraire: ${ticketDetail["nom_itineraire"]}
                            Date: ${ticketDetail["date_complet"]}
                            Bus: ${ticketDetail["nom_bus"]} N°${ticketDetail["numero_bus"]}
                            Siège: ${ticketDetail["numero_siege"]}
                          ''',
                          size: 150,
                          version: QrVersions.auto,
                        ),
                      ],
                    ),
                  ),
                ),
                RichText(
                    text:TextSpan(
                      text: 'Rappel: ',
                        style: TextStyle(
                          color: const Color(0xFF192A41),
                          fontWeight: FontWeight.w700,
                          fontSize: 15
                        ),
                      children: [
                        TextSpan(
                          text: "il suffit de montrer votre QR code lors de l'embarquement",
                          style: TextStyle(
                            color:  Colors.black,
                            fontWeight: FontWeight.w400,
                              fontSize: 14
                          ),
                        )
                      ]
                    )
                ),
                TextButton(onPressed: (){},
                    child: Text(
                        "Suivre mon trajet",
                      style: TextStyle(
                          color: const Color(0xFFDD4011),
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),
                    )
                ),
                Expanded(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor: Colors.grey[350],
                            padding: EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: ()=>Navigator.pop(context),
                          child: Text('Annuler')
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor: Color(0xFF192A41),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: (){},
                          child: Text('Télécharger')
                      ),
                    )
                  ],
                ),
                )
            ],
          ),
          ),
      )
      );
  }
}