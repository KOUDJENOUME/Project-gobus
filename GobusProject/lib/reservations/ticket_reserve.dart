import 'package:flutter/material.dart';
import 'package:flutter_todo_app/reservations/detail_reservation.dart';

final List<Map<String, dynamic>> ticketReserve = [
  {
    "id_ticket": 375845,
    "nom_itineraire":"Abomey-Calavi-Bohicon",
    "date_complet":"Lundi 16 Decembre 2024",
    "date_reservation": DateTime(2024, 12, 11),
  },
  {
    "id_ticket": 375846,
    "nom_itineraire":"Savalou-Parakou",
    "date_complet":"Lundi 16 Decembre 2024",
    "date_reservation": DateTime(2024, 12, 11),
  },
  {
    "id_ticket": 375847,
    "nom_itineraire":"Dassa-Banikouara",
    "date_complet":"Lundi 16 Decembre 2024",
    "date_reservation": DateTime(2024, 10, 10),
  },
  {
    "id_ticket": 375848,
    "nom_itineraire":"Cotonou-Parakou",
    "date_complet":"Lundi 20 Decembre 2024",
    "date_reservation": DateTime(2024, 12, 11),
  },
  {
    "id_ticket": 375850,
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
  int currentInd =0;
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
              "Tickets Reservé(s)",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
            centerTitle: true,
          ),
          body: ticketReserve.isEmpty?
          Center(
            child: Text('Pas de ticket reservé',
              style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w500,
              fontSize: 12.8,
              fontFamily: 'Montserrat',),),
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
                                    color: Color(0xFF192A41),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Text(
                                    ticket["date_complet"],
                                  style: TextStyle(color: Color(0xFF000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.8,
                                    fontFamily: 'Montserrat',),
                                ),
                                Text(
                                    'Reservé le ${ticket["date_reservation"].day}/${ticket["date_reservation"].month}/${ticket["date_reservation"].year}',
                                  style: TextStyle(
                                    color: Color(0xFFDD4011),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      onPressed:(){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context)=> const DetailReservation()
                                            )
                                        );
                                      },
                                      icon: const Text(
                                        'Voir les détails de reservations',
                                        style: TextStyle(
                                          color: Color(0xFFDD4011),
                                          fontSize: 12.8,
                                          fontFamily: 'Montserrat',
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentInd,
            selectedItemColor: const Color(0xFFDD4011),
            unselectedItemColor: const Color(0xFF192A41),
            onTap: (index) {
              setState(() {
                currentInd = index;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: 'Rechercher',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_number_outlined),
                activeIcon: Icon(Icons.confirmation_number),
                label: 'Tickets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: 'Profil',
              ),
            ],
          ),
        )
    );
  }
}
