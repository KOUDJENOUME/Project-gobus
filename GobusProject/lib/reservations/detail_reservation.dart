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
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF000000),
    fontWeight: FontWeight.w500,
    fontSize: 12.8,
    fontFamily: 'Montserrat',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                weight: 700,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Détails de réservation',
              style: TextStyle(fontWeight: FontWeight.w700,
                fontSize: 24,
                fontFamily: 'Montserrat',
              )
            ),
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
                    padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticketDetail["nom_itineraire"],
                              style: titleStyle,
                            ),
                            Text(ticketDetail["date_complet"],style: name,)
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
                                Text("Nom du Bus",style: name,),
                                Text(
                                  ticketDetail["nom_bus"],
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("ID Ticket",style: name,),
                                Text(
                                  "${ticketDetail["id_ticket"]}",
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("Heure de Depart",style: name,),
                                Text(
                                  "${ticketDetail["heure_depart"]}",
                                  style: titleStyle,
                                ),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Numero de siege",style: name,),
                                Text(
                                  "${ticketDetail["numero_siege"]}",
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("Numero du bus",style: name,),
                                Text(
                                  "${ticketDetail["numero_bus"]}",
                                  style: titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text("Heure d'Arrivée",style: name,),
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
                      Text('Total:',style: name.copyWith(fontSize: 16.2),),
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
                        style: titleStyle.copyWith(fontSize: 16),
                      children: [
                        TextSpan(
                          text: "il suffit de montrer votre QR code lors de l'embarquement",
                          style: name.copyWith(fontSize: 15),
                        )
                      ]
                    )
                ),
                TextButton(onPressed: (){},
                    child: Text(
                        "Suivre mon trajet",
                      style: titleStyle.copyWith(fontSize: 15,color: Color(0xFFDD4011)),
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                            padding: EdgeInsets.symmetric(vertical: 5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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