import 'package:flutter/material.dart';
import 'profil.dart'; // Importez la page ProfilePage

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Votre bus est déjà arrivé !',
      'icon': 'assets/bus_arrived.png',
    },
    {
      'title': 'Vous avez raté votre bus.',
      'icon': 'assets/bus_missed.png',
    },
    {
      'title': 'Prêt à démarrer ?',
      'icon': 'assets/bus_ready.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigation vers ProfilePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(
            title: notifications[index]['title']!,
            iconPath: notifications[index]['icon']!,
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String iconPath;

  NotificationCard({required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 28,
            backgroundImage: AssetImage(iconPath),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xFFDD4011),
              shape: BoxShape.circle,
            ),
            child: Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
