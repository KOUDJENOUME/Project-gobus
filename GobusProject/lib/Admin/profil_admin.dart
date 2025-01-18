import 'package:flutter/material.dart';

final Map<String,dynamic> adminInfo = {
  "nom": "WILSON",
  "prenom": "Edward",
  "email": "karelhans@amen.com",
};

class ProfilAdmin extends StatefulWidget {
  const ProfilAdmin({super.key});

  @override
  State<ProfilAdmin> createState() => _ProfilAdminState();
}

class _ProfilAdminState extends State<ProfilAdmin> {
  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF000000),
    fontSize: 11,
    fontFamily: 'Montserrat',
  );
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          child:Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 20,
                      children: [
                        Container(
                          width:80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/profilUser.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${adminInfo["prenom"]}  ${adminInfo["nom"]}",
                              style: TextStyle(
                                color: Color(0xFF192A41),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              " ${adminInfo["email"]}",
                              style: TextStyle(
                                color: Color(0xFF192A41),
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 25,),
                    Text("Information Personnelle",style: titleStyle,),
                    SizedBox(height: 2,),
                    Card(
                      elevation: 2,
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.account_circle_outlined, size: 35,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Compte',
                                      style:titleStyle.copyWith(fontSize: 14,fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 4),
                                    Text('Modifier les détails du compte',
                                        style:name
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[900]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.notifications_active_outlined, size: 35,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Notifications',
                                      style:titleStyle.copyWith(fontSize: 14,fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 4),
                                    Text('Voir toutes les notifications',
                                        style:name
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[900]),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Text("Paramètres Généraux",style: titleStyle,),
                    SizedBox(height: 2,),
                    Card(
                      elevation: 2,
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.settings_outlined, size: 35,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Paramètres',
                                      style:titleStyle.copyWith(fontSize: 14,fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 4),
                                    Text('Definir mes préférences',
                                        style:name
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[900]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.help_outline, size: 35,fill: 0.8,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Aides',
                                      style:titleStyle.copyWith(fontSize: 14,fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 4),
                                    Text('Se faire aider',
                                        style:name
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[900]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: (){},
                    child: Text("Deconnexion",
                      style: titleStyle.copyWith(color: Color(0xFFDD4111)),
                    )
                ),
              )
            ],
          )
        ),
     )
    );
  }
}
