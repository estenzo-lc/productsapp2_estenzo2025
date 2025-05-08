import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final themeColor = appState.themeColor;
    final isFilipino = appState.language == 'fil';

    final colorOptions = [
      {'theme': Color(0xFFF7D2FF), 'bg': Color(0xFFC3F9FF)},
      {'theme': Color(0xFFC0D7FF), 'bg': Color(0xFFBEC1FF)},
      {'theme': Color(0xFFC8B3FF), 'bg': Color(0xFFF7D2FF)},
      {'theme': Color(0xFFBEC1FF), 'bg': Color(0xFFC3F9FF)},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isFilipino ? 'Mga Setting ng Profile' : 'Profile Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              isFilipino ? 'Pumili ng Tema' : 'Choose Theme Color',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: colorOptions.map((color) {
                return GestureDetector(
                  onTap: () {
                    appState.setThemeColor(color['theme']!);
                    appState.setBgColor(color['bg']!); // Set background color
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color['theme'],
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Text(
              isFilipino ? 'Pumili ng Wika' : 'Choose Language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: appState.language,
              onChanged: (String? newLanguage) {
                if (newLanguage != null) {
                  appState.toggleLanguage();
                }
              },
              items: const [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'fil',
                  child: Text('Filipino'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(isFilipino ? 'I-save' : 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}
