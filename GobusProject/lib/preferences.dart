import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  // Les valeurs initiales des préférences
  String selectedDestination = "Parakou";
  String selectedTime = "Soirée";
  String selectedTheme = "Claire";

  // Les options disponibles pour chaque Dropdown
  final List<String> destinations = ["Parakou", "Cotonou", "Porto-Novo"];
  final List<String> times = ["Matin", "Après-midi", "Soirée"];
  final List<String> themes = ["Claire", "Sombre"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Définissez vos préférences",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildDropdown(
                "Destination préférée",
                selectedDestination,
                destinations,
                    (value) {
                  setState(() {
                    selectedDestination = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildDropdown(
                "Heures de voyages préférées",
                selectedTime,
                times,
                    (value) {
                  setState(() {
                    selectedTime = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildDropdown(
                "Thème de l'application",
                selectedTheme,
                themes,
                    (value) {
                  setState(() {
                    selectedTheme = value!;
                    _applyTheme(value);
                  });
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity, // Bouton qui occupe toute la largeur
                child: ElevatedButton(
                  onPressed: () {
                    // Logique pour sauvegarder ou traiter les préférences
                    print("Destination : $selectedDestination");
                    print("Heures de voyage : $selectedTime");
                    print("Thème : $selectedTheme");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Couleur du bouton
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Modifier",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> options,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            items: options
                .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  void _applyTheme(String theme) {
    if (theme == "Claire") {
      ThemeMode.light;
    } else {
      ThemeMode.dark;
    }
    //print("Thème appliqué : $theme");
  }
}
