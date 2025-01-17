import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accueil Réserve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AccueilReserve(),
    );
  }
}

class AccueilReserve extends StatefulWidget {
  const AccueilReserve({super.key});

  @override
  State<AccueilReserve> createState() => _AccueilReserveState();
}

class _AccueilReserveState extends State<AccueilReserve> {
  int currentInd = 0; // Indice de l'onglet sélectionné dans la BottomNavigationBar

  // Définition des styles pour les textes
  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 20,
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
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.account_circle_outlined,
            size: 40,
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Image(
            image: AssetImage('assets/image/logo.png'),
            height: 40,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {
                // Action pour l'icône de notification
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              Card(
                  color: Color(0xFF192A41),
                  child: Padding(
                    padding: EdgeInsets.all(17),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Voyagez",
                              style: titleStyle.copyWith(color: Color(0xFFDD4011), fontSize: 23),
                              children: [
                                TextSpan(
                                  text: "au cœur de l’histoire\nbéninoise !",
                                  style: titleStyle.copyWith(color: Colors.white, fontSize: 23),
                                )
                              ]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Découvrez les trésors de Ouidah, d’Abomey et "
                              "bien d'autres villes emblématiques. Chaque destination vous plonge dans l'âme culturelle du Bénin.",
                          style: name.copyWith(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                              text: "🚌 Réservez maintenant",
                              style: name.copyWith(color: Color(0xFFDD4011), fontSize: 15),
                              children: [
                                TextSpan(
                                  text: ' et partez à la rencontre de notre patrimoine !',
                                  style: name.copyWith(color: Colors.white, fontSize: 15),
                                )
                              ]),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 25),
              Text('Reservation', style: titleStyle.copyWith(fontSize: 21)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    label: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFFDD4011),
                      size: 18,
                    ),
                    icon: Text(
                      "Voir tous les tickets",
                      style: name.copyWith(fontSize: 15),
                    ),
                  )
                ],
              ),
              Card(
                color: Colors.grey[350],
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("De", style: name.copyWith(fontSize: 13.9)),
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Selectionnez votre lieu  de depart ",
                                    hintStyle: name.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("Vers", style: name.copyWith(fontSize: 13.9)),
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Selectionnez votre lieu d’arrivé ",
                                    hintStyle: name.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Aller", style: name.copyWith(fontSize: 13)),
                                  Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 140,
                                      height: 45,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Selectionnez votre lieu  de depart ",
                                            hintStyle: name.copyWith(fontSize: 14),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Retour", style: name.copyWith(fontSize: 13.9)),
                                  Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 140,
                                      height: 45,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Selectionnez votre lieu  de depart ",
                                            hintStyle: name.copyWith(fontSize: 14),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 19),
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Type de passgers : Enfant/Adulte",
                                    hintStyle: name.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                          SizedBox(height: 17),
                          Center(
                            child: Transform.translate(
                              offset: Offset(0, 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                    backgroundColor: Color(0xFFDD4011),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Rechercher",
                                    style: titleStyle.copyWith(fontSize: 16),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )),
              )
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
      ),
    );
  }
}
