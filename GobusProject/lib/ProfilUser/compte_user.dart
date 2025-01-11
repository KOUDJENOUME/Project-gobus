import 'package:flutter/material.dart';

Map<String, dynamic> infoProfil = {
  "nom": "WILSON",
  "prenom": "Edward",
  "numero": 48552573,
  "email": "karelhans@amen.com",
  "motpasse": "123456"
};

class CompteUser extends StatefulWidget {
  const CompteUser({super.key});

  @override
  State<CompteUser> createState() => _CompteUserState();
}

class _CompteUserState extends State<CompteUser> {

  final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    fontFamily: 'Montserrat',
  );
  final TextStyle titleStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              weight: 700,
            ),
            onPressed: () {},
            tooltip: 'Retour',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Center(
                  child: Tooltip(
                    message: 'Photo de profil',
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/profilUser.png'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
                ),
                const SizedBox(height: 6,),
                Text("${infoProfil['prenom'] ?? 'Non défini'} ${infoProfil['nom'] ?? 'Non défini'}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                    fontFamily: 'Montserrat'
                  ),
                ),
                const SizedBox(height: 25),
                Card(
                  color: Colors.grey[350],
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nom",
                              style: nameStyle,
                            ),
                            Text(
                              "${infoProfil['nom']}",
                              style: titleStyle,
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.edit),
                          tooltip: 'Modifier',
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[350],
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Prénom",style: nameStyle),
                            Text('${infoProfil["prenom"]}',style: titleStyle,)
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.edit),
                          tooltip: 'Modifier',
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[350],
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Numéro de téléphone",style:nameStyle,),
                            Text("+229 01${infoProfil['numero']}",style: titleStyle,)
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.edit),
                          tooltip: 'Modifier',
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[350],
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("E-mail",style:nameStyle),
                            Text("${infoProfil['email']}",style:titleStyle)
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.edit),
                          tooltip: 'Modifier',
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[350],
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mot de passe",style: nameStyle),
                            Text("${infoProfil['motpasse']}",style:titleStyle)
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.edit),
                          tooltip: 'Modifier',
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28,),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF192A41),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: (){},
                    child: const Text(
                      "Valider",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                        fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
