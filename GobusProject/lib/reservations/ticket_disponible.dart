import 'package:flutter/material.dart';

final List<Map<String, dynamic>> ticketInfo = [
  {
    "nom_itineraire":"Abomey-Calavi-Bohicon",
    "date_complet":"Lundi 16 Decembre 2024",
    "nom_bus":"Baobab",
    "nombre_place":50,
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_itineraire":"Savalou-Parakou",
    "date_complet":"Lundi 16 Decembre 2024",
    "nom_bus":"Baobab",
    "nombre_place":50,
    "montant":2000,
    "devise":"XOF"
  },
  {
    "nom_itineraire":"Dassa-Banikouara",
    "date_complet":"Lundi 10 Octobre 2024",
    "nom_bus":"Baobab",
    "nombre_place":80,
    "montant":4000,
    "devise":"XOF"
  }
];

class TicketDisponible extends StatefulWidget {
  const TicketDisponible({super.key});

  @override
  State<TicketDisponible> createState() => _TicketDisponibleState();
}

class _TicketDisponibleState extends State<TicketDisponible> {
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
              "Tickets Disponibles",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                  itemCount: ticketInfo.length,
                    itemBuilder: (context,index)
                    {
                      final ticket = ticketInfo[index];
                      return Card(
                        elevation: 1,
                        color: Colors.grey[350],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                      Text("Nombre de place", ),
                                      Text(
                                          "${ticket["nombre_place"]}",
                                          style: titleStyle
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(height: 20,),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFDD4011),
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Confirmation'),
                                          content: Text(
                                            'Voulez-vous réserver un ticket pour ${ticket["nom_itineraire"]} ?'
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text('Annuler'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Réservation effectuée !'),
                                                    backgroundColor: Colors.green,
                                                  ),
                                                );
                                              },
                                              child: const Text('Confirmer'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Réserver",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
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
