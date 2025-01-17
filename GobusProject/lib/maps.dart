import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class OSMWithSearchPage extends StatefulWidget {
  const OSMWithSearchPage({super.key});

  @override
  _OSMWithSearchPageState createState() => _OSMWithSearchPageState();
}

class _OSMWithSearchPageState extends State<OSMWithSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController = MapController();
  LatLng _mapCenter = LatLng(6.3703, 2.3912); // Coordonnées par défaut (Cotonou)
  List<dynamic> _searchResults = [];

  Future<void> _searchPlace(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1&limit=5');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _searchResults = data;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de la recherche du lieu.")),
      );
    }
  }

  void _goToLocation(double lat, double lon) {
    setState(() {
      _mapCenter = LatLng(lat, lon);
      _mapController.move(_mapCenter, 15.0);
      _searchResults = [];
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobus - Recherche de Lieux'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Rechercher un lieu...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (_searchController.text.isNotEmpty) {
                      _searchPlace(_searchController.text);
                    }
                  },
                ),
              ],
            ),
          ),
          if (_searchResults.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final result = _searchResults[index];
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(result['display_name']),
                    onTap: () {
                      final lat = double.parse(result['lat']);
                      final lon = double.parse(result['lon']);
                      _goToLocation(lat, lon);
                    },
                  );
                },
              ),
            ),
          Expanded(
            flex: _searchResults.isEmpty ? 1 : 0,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _mapCenter,
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  /*attributionWidget: Text("© OpenStreetMap contributors"),*/
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _mapCenter,
                      width: 80.0,
                      height: 80.0,
                      rotate: true, child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                      /*rotateBuilder: (ctx) => ,*/
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
