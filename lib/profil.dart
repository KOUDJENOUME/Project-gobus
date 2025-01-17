import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // Arrondi des bords
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileHeader(),
                  _buildSectionTitle('Information Personnelle'),
                  _buildMenuItem(
                      context,
                      'Compte',
                      'Modifier les détails du compte',
                      Icons.account_circle, () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ComptePage()));
                  }),
                  _buildMenuItem(
                      context,
                      'Mes Récompenses',
                      'Voir les promotions disponibles',
                      Icons.card_giftcard, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecompensesPage()));
                  }),
                  _buildSectionTitle('Paramètres Généraux'),
                  _buildMenuItem(context, 'Mes Remboursements',
                      'Gérer mes remboursements', Icons.payment, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RemboursementsPage()));
                  }),
                  _buildMenuItem(context, 'Réservations précédentes',
                      'Voir mes réservations précédentes', Icons.event, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservationsPage()));
                  }),
                  _buildMenuItem(context, 'Paramètres',
                      'Définir mes préférences', Icons.settings, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => parametresPage()));
                  }),
                  _buildMenuItem(context, 'Aides', 'Se faire aider', Icons.help,
                      () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AidesPage()));
                  }),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Ajoutez la logique de déconnexion ici
                      },
                      child: Text('Déconnexion',
                          style: TextStyle(
                            color: Color(0xFFDD4011),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50, color: Colors.blue),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Edward WILSON',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  )),
              Text('karelhans@amen.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            color: Colors.black87),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String subtitle,
      IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
          )),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}

// Placeholder pour les différentes pages de navigation
class ComptePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compte')),
      backgroundColor: Colors.white,
    );
  }
}

class RecompensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes Récompenses')),
      backgroundColor: Colors.white,
    );
  }
}

class RemboursementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes Remboursements')),
      backgroundColor: Colors.white,
    );
  }
}

class ReservationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Réservations précédentes')),
      backgroundColor: Colors.white,
    );
  }
}

class parametresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paramètres')),
      backgroundColor: Colors.white,
    );
  }
}

class AidesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aides')),
      backgroundColor: Colors.white,
    );
  }
}
