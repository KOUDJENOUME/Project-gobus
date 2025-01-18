import 'package:flutter/material.dart';

final List<Map<String, dynamic>> userApp = [
  {
    "nom": "WILSON",
    "prenom": "Edward",
    "email": "karelhans@amen.com",
    "statut":"Actif"
  },
  {
    "nom": "Todon",
    "prenom": "Tristan",
    "email": "Tristan@amen.com",
    "statut":"Suspendu"
  },
  {
    "nom": "WILSON",
    "prenom": "Edward",
    "email": "Edward@amen.com",
    "statut":"Suspendu"
  },
  {
    "nom": "Doe",
    "prenom": "John",
    "email": "John@amen.com",
    "statut":"Actif"
  },

];
class GestionUtilisateur extends StatefulWidget {
  const GestionUtilisateur({super.key});

  @override
  State<GestionUtilisateur> createState() => _GestionUtilisateurState();
}

class _GestionUtilisateurState extends State<GestionUtilisateur> {
  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF000000),
    fontSize: 12.5,
    fontFamily: 'Montserrat',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Gestion des users",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          body: userApp.isEmpty?
          Center(
            child: Text('Pas de ticket disponible',
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w500,
                fontSize: 12.8,
                fontFamily: 'Montserrat',),),
          ):
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Card(
                      color: Color(0xFF192A41),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none,

                      ),
                      child: Padding(
                          padding: EdgeInsets.all(16),
                          child:SizedBox(
                            width: double.infinity,
                            child: RichText(
                                text: TextSpan(
                                    text: 'Ajouter ',
                                    style: titleStyle.copyWith(color: Color(0xFFDD4011)),
                                    children: [
                                      TextSpan(
                                        text: ', ',
                                        style:titleStyle.copyWith(color: Color(0xFFFFFFFF)),
                                      ),
                                      TextSpan(
                                        text: 'Modifier ',
                                      ),
                                      TextSpan(
                                        text: 'ou ',
                                        style: titleStyle.copyWith(color: Color(0xFFFFFFFF)),
                                      ),
                                      TextSpan(
                                        text: 'supprimer ',
                                      ),
                                      TextSpan(
                                        text: 'des admin ou superadmin ',
                                        style:titleStyle.copyWith(color: Color(0xFFFFFFFF)) ,
                                      )
                                    ]
                                )
                            ),
                          )
                      )
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search,
                        size: 40,
                      ),
                      SizedBox(
                        height: 42,
                        width: 330,
                        child: SearchBar(
                          hintText: "Ex: Edgard WILSON",
                          hintStyle: WidgetStatePropertyAll(name.copyWith(fontSize: 12)),
                          backgroundColor: WidgetStatePropertyAll(Colors.grey[350]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: List.generate(
                        userApp.length,
                         (index){
                           final user = userApp[index];
                           return Card(
                             elevation: 1,
                             color: Colors.grey[350],
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             margin: EdgeInsets.symmetric(vertical: 10.0),
                             child: Padding(
                               padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     spacing: 20,
                                     children: [
                                       Container(
                                         width:60,
                                         height: 60,
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
                                             "${user["prenom"]}  ${user["nom"]}",
                                             style: TextStyle(
                                               color: Color(0xFF192A41),
                                               fontWeight: FontWeight.w600,
                                               fontSize: 18,
                                               fontFamily: 'Montserrat',
                                             ),
                                           ),
                                           SizedBox(height: 4,),
                                           Text(
                                             " ${user["email"]}",
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
                                   const Divider(height: 10,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("Status:",style: name.copyWith(fontSize: 16),),
                                       Text("${user["statut"]} ",style: titleStyle.copyWith(color: Color(0xFFDD4011), fontSize: 15),)
                                     ],
                                   ),
                                   const SizedBox(height: 5,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     spacing: 10,
                                     children: [
                                       SizedBox(
                                         width:108,
                                         height: 24,
                                         child: ElevatedButton(
                                             style: ElevatedButton.styleFrom(
                                                 shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(50),
                                                     side: BorderSide(width: 1,color: Color(0xFF192A41))
                                                 ),
                                               backgroundColor: Colors.grey[350]
                                             ),
                                             onPressed: (){}, child:
                                         Text("Réactiver",style: titleStyle.copyWith(fontSize: 11),)
                                         ),
                                       ),
                                       SizedBox(
                                         width:108,
                                         height: 24,
                                         child: ElevatedButton(
                                             style: ElevatedButton.styleFrom(
                                                 shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(50),
                                                     side: BorderSide(width: 1,color: Color(0xFFDD4011))
                                                 )
                                             ),
                                             onPressed: (){}, child:
                                         Text("Suspendre",style: titleStyle.copyWith(fontSize: 10.36),)
                                         ),
                                       ),
                                       SizedBox(
                                         width:108,
                                         height: 24,
                                         child: ElevatedButton(
                                             style: ElevatedButton.styleFrom(
                                                 backgroundColor: Color(0xFFDD4011),
                                                 shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(50),
                                                 )
                                             ),
                                             onPressed: (){}, child:
                                         Text("Supprimer",style: titleStyle.copyWith(fontSize: 10.52,color: Color(0xFFFFFFFF)),)
                                         ),
                                       ),
                                     ],
                                   )
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
        )
    );
  }
}
