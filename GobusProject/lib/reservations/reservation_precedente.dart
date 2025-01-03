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
    fontWeight: FontWeight.w700,
    fontSize: 16,
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
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
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
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    ticket["nom_itineraire"],
                                    style: titleStyle
                                ),
                                Text(
                                    ticket["date_complet"]
                                ),
                                const Divider(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Nom du Bus",),
                                        Text(
                                            ticket["nom_bus"],
                                            style: titleStyle
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("ID Ticket", ),
                                        Text(
                                            "${ticket["id_ticket"]}",
                                            style: titleStyle
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Montant:"),
                                    Text(
                                      "${ticket["montant"]} ${ticket["devise"]}",
                                      style: TextStyle(
                                          color: const Color(0xFFDD4011),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16
                                      ),
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
