import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

final List<Map<String, int>> infoVente = [
  {
    "prix": 1000,
    "nombre_vendu": 30
  },
  {
    "prix": 2000,
    "nombre_vendu": 70
  },
  {
    "prix": 3000,
    "nombre_vendu": 50
  },
  {
    "prix": 4000,
    "nombre_vendu": 87
  },
  {
    "prix": 5000,
    "nombre_vendu": 100
  },
];

final double total = 20000000;

final List<Map<String, dynamic>> infoRappot = [
  {
    "nom_bus": "Baobab",
    "nombre_kilomètre": 125,
    "nombre_ticket_vendu": 100,
    "nombre_heure": 120,
    "nombre_passager": 100,
    "somme": 10000,
  },
  {
    "nom_bus": "TRG",
    "nombre_kilomètre": 140,
    "nombre_ticket_vendu": 225,
    "nombre_heure": 110,
    "nombre_passager": 225,
    "somme": 22500,
  },
  {
    "nom_bus": "Trans",
    "nombre_kilomètre": 300,
    "nombre_ticket_vendu": 300,
    "nombre_heure": 300,
    "nombre_passager": 260,
    "somme": 26000,
  },
];

class StatistiqueVente extends StatefulWidget {
  const StatistiqueVente({Key? key}) : super(key: key);

  @override
  State<StatistiqueVente> createState() => _StatistiqueVenteState();
}

class _StatistiqueVenteState extends State<StatistiqueVente> {

  final TextStyle titleStyle = const TextStyle(
    color: Color(0xFF192A41),
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: 'Montserrat',
  );
  final TextStyle name = const TextStyle(
    color: Color(0xFF000000),
    fontSize: 14,
    fontFamily: 'Montserrat',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistique",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              text: 'Visualiser ',
                              style: titleStyle.copyWith(color: Color(0xFFDD4011)),
                              children: [
                                TextSpan(
                                  text: 'les ',
                                  style:titleStyle.copyWith(color: Color(0xFFFFFFFF)),
                                ),
                                TextSpan(
                                  text: 'statistique ',
                                ),
                                TextSpan(
                                  text: 'de ventes réalisés durant le mois',
                                  style: titleStyle.copyWith(color: Color(0xFFFFFFFF)),
                                ),
                              ]
                          )
                      ),
                    )
                )
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Catégories en abscisse:",style: titleStyle.copyWith(fontSize: 15),),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 1.0,color: Color(0xFFDD4011))
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 2),
                    child: Text("Prix",style: titleStyle.copyWith(fontSize: 13)),
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),

            const Text(
              'tickets vendu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 400,
              child: BarChart(
                BarChartData(
                  maxY: 100,
                  minY: 0,
                  barGroups: List.generate(
                    infoVente.length,
                        (index) => BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: infoVente[index]["nombre_vendu"]!.toDouble(),
                          color: infoVente[index]["nombre_vendu"]! <= 50
                            ? const Color(0xFFDD4011) // Orange foncé
                            : const Color(0xFF192A41), // Bleu marine
                          width: 40,
                          borderRadius: BorderRadius.zero
                        ),
                      ],
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                      left: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < infoVente.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(infoVente[index]["prix"].toString()),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        getTitlesWidget: (value, meta) {

                          if (value % 10 == 0) {
                            return Text(value.toInt().toString());
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Spacer(),
                const Text(
                  'Prix',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rapports",style: titleStyle.copyWith(fontSize: 15),),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(width: 1.0,color: Color(0xFFDD4011))
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70,vertical: 1),
                    child: Text("Mois",style: titleStyle.copyWith(fontSize: 13)),
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: 358,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      columns: [
                        DataColumn2(
                          label: Text('Nom du Bus:',
                              style: name,),
                          size: ColumnSize.L,
                        ),
                        ...infoRappot.map((info) => DataColumn2(
                          label: Text(
                            info['nom_bus'],
                            style: titleStyle.copyWith(fontSize: 15, color: Color(0xFFDD4011)),
                          ),
                          size: ColumnSize.M,
                        )),
                      ],
                      rows: [
                        DataRow2(cells: [
                          DataCell(Text('Nbr de kilometre:',style: name,)),
                          ...infoRappot.map((info) => DataCell(
                            Text('${info['nombre_kilomètre']}km',
                                style: titleStyle.copyWith(fontSize: 15,)
                            ),
                          )),
                        ]),
                        DataRow2(cells: [
                          DataCell(Text('Nbr tck vendu:',style: name,)),
                          ...infoRappot.map((info) => DataCell(
                            Text('${info['nombre_ticket_vendu']}',
                                style: titleStyle.copyWith(fontSize: 15,)
                            ),
                          )),
                        ]),
                        DataRow2(cells: [
                          DataCell(Text("Nbr d'heure:",style: name,)),
                          ...infoRappot.map((info) => DataCell(
                            Text('${info['nombre_heure']}',
                                style: titleStyle.copyWith(fontSize: 15,)
                            ),
                          )),
                        ]),
                        DataRow2(cells: [
                          DataCell(Text('Nbr passager:',style: name,)),
                          ...infoRappot.map((info) => DataCell(
                            Text('${info['nombre_passager']}',
                                style: titleStyle.copyWith(fontSize: 15,)
                            ),
                          )),
                        ]),
                        DataRow2(cells: [
                          DataCell(Text('Somme:',style: name,)),
                          ...infoRappot.map((info) => DataCell(
                            Text('${info['somme']}F',
                                style: titleStyle.copyWith(fontSize: 15,)
                            ),
                          )),
                        ]),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600],
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                            style: titleStyle.copyWith(fontSize: 15,),
                        ),
                        Text(
                          '${total.toStringAsFixed(0)}F',
                            style: titleStyle.copyWith(fontSize: 15,color: Color(0xFFDD4011))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}