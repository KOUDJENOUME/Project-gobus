import 'package:flutter/material.dart';

final List<Map<String, dynamic>> ticketReserve = [
  {
    "nom_itineraire":"Abomey-Calavi-Bohicon",
    "date_complet":"Lundi 16 Decembre 2024",
    "date_reservation": DateTime(2024, 12, 11),
  },
  {
    "nom_itineraire":"Savalou-Parakou",
    "date_complet":"Lundi 16 Decembre 2024",
    "date_reservation": DateTime(2024, 12, 11),
  },
  {
    "nom_itineraire":"Dassa-Banikouara",
    "date_complet":"Lundi 16 Decembre 2024",
    "date_reservation": DateTime(2024, 10, 10),
  },
  {
    "nom_itineraire":"Cotonou-Parakou",
    "date_complet":"Lundi 20 Decembre 2024",
    "date_reservation": DateTime(2024, 12, 11),
  },
  {
    "nom_itineraire":"Dassa-Banikouara",
    "date_complet":"Lundi 16 Decembre 2024",
    "date_reservation": DateTime(2024, 10, 10),
  },
];


class TicketReserve extends StatefulWidget {
  const TicketReserve({super.key});

  @override
  State<TicketReserve> createState() => _TicketReserveState();
}

class _TicketReserveState extends State<TicketReserve> {
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
              "Tickets Reservé(s)",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: ticketReserve.isEmpty?
          Center(
            child: Text('Pas de ticket reservé',style: TextStyle(fontSize: 18,),),
          ):
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: ticketReserve.length,
                      itemBuilder: (context,index)
                      {
                        final ticket = ticketReserve[index];
                        return Card(
                          elevation: 1,
                          color: Colors.grey[350],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  ticket["nom_itineraire"],
                                  style: TextStyle(
                                    color: const Color(0xFF192A41),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                    ticket["date_complet"]
                                ),
                                Text(
                                    'Reservé le ${ticket["date_reservation"].day}/${ticket["date_reservation"].month}/${ticket["date_reservation"].year}',
                                  style: TextStyle(
                                    color: Color(0xFFDD4011),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      onPressed: (){},
                                      icon: const Text(
                                        'Voir les détails de reservations',
                                        style: TextStyle(
                                          color: Color(0xFFDD4011),
                                        ),
                                      ),
                                      label: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Color(0xFFDD4011),
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
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
