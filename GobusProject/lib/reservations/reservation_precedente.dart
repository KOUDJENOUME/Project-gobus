import 'package:flutter/material.dart';

final List<Map<String, dynamic>> ticketPrecedent = [
  {
    "nom_itineraire":"Abomey-Calavi-Bohicon",
    "date_complet":"Lundi 16 Decembre 2024",
    "nom_bus":"Baobab",
    "id_ticket": 375847,
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_itineraire":"Savalou-Parakou",
    "date_complet":"Lundi 16 Decembre 2024",
    "nom_bus":"Baobab",
    "id_ticket": 375848,
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_itineraire":"Dassa-Banikouara",
    "date_complet":"Lundi 10 Octobre 2024",
    "nom_bus":"Baobab",
    "id_ticket": 375849,
    "montant":4000,
    "devise":"XOF"
  }
];

class ReservationPrecedente extends StatefulWidget {
  const ReservationPrecedente({super.key});

  @override
  State<ReservationPrecedente> createState() => _ReservationPrecedenteState();
}

class _ReservationPrecedenteState extends State<ReservationPrecedente> {
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
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back,
              size: 30,
              weight: 700,
            ),
            title: const Text(
              "Réservations Précédentes",
              style: TextStyle(fontWeight: FontWeight.w700,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
            centerTitle: true,
          ),
          body: ticketPrecedent.isEmpty?
          Center(
            child: Text('Pas de reservation précédente'),
          ):
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: ticketPrecedent.length,
                      itemBuilder: (context,index)
                      {
                        final ticket = ticketPrecedent[index];
                        return Card(
                          elevation: 1,
                          color: Colors.grey[350],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    ticket["nom_itineraire"],
                                    style: titleStyle
                                ),
                                Text(
                                    ticket["date_complet"],style: name,
                                ),
                                const Divider(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Nom du Bus",style: name,),
                                        Text(
                                            ticket["nom_bus"],
                                            style: titleStyle
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("ID Ticket", style: name,),
                                        Text(
                                            "${ticket["id_ticket"]}",
                                            style: titleStyle
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Montant:",style: name,),
                                    Text(
                                      "${ticket["montant"]} ${ticket["devise"]}",
                                      style: titleStyle.copyWith(color: Color(0xFFDD4011))
                                    ),
                                  ],
                                ),
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
    );
  }
}
