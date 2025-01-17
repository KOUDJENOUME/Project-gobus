import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isLoading = false;

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1&limit=10');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> results = jsonDecode(response.body);
        setState(() {
          _searchResults = results;
        });
      } else {
        print('Error: ${response.statusCode}');
        setState(() {
          _searchResults = [];
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _searchResults = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Rechercher un lieu",
            border: InputBorder.none,
          ),
          onChanged: _performSearch,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic, color: Colors.black),
            onPressed: () {
              // Logique pour la recherche vocale
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildChipsSection(),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildChipsSection() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildChip("Chez moi"),
          _buildChip("Work"),
          _buildChip("Agua Land"),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () {
          _searchController.text = label;
          _performSearch(label);
        },
        child: Chip(
          label: Text(label),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final place = _searchResults[index];
        final displayName = place['display_name'] ?? 'Lieu inconnu';
        final lat = place['lat'];
        final lon = place['lon'];

        return ListTile(
          leading: Icon(Icons.location_on, color: Colors.blue),
          title: Text(displayName),
          subtitle: Text("Lat: $lat, Lon: $lon"),
          onTap: () {
            // Action à effectuer lorsqu'un lieu est sélectionné
            print('Lieu sélectionné : $displayName ($lat, $lon)');
          },
        );
      },
    );
  }
}
