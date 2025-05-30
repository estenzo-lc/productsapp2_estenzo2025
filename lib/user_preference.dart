import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/background_model.dart';
import '/models/language_model.dart';

class UserPreferencePage extends StatefulWidget {
  const UserPreferencePage({super.key});

  @override
  _UserPreferencePageState createState() => _UserPreferencePageState();
}

class _UserPreferencePageState extends State<UserPreferencePage> {
  Color? selectedThemeColor; // Currently selected theme color
  String? selectedLanguage; // Currently selected language

  @override
  Widget build(BuildContext context) {
    // Access providers for background and language
    final backgroundModel = Provider.of<Backgroundmodel>(context);
    final languageModel = Provider.of<LanguageModel>(context);
    final isFilipino = languageModel.isFilipino(); // Determine language setting

    // Translations for text based on selected language
    final titleText = isFilipino ? "Mga Kagustuhan" : "User Preferences";
    final selectThemeText =
        isFilipino ? "Piliin ang Tema" : "Select Theme Color";
    final selectLanguageText =
        isFilipino ? "Piliin ang Wika" : "Select Language";
    final saveChangesText =
        isFilipino ? "I-save ang mga pagbabago" : "Save Changes";
    final missingSelectionText =
        isFilipino
            ? "Pumili ng parehas na tema at wika."
            : "Please select both theme and language.";

    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        backgroundColor: backgroundModel.appBar,
      ),
      backgroundColor: backgroundModel.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Theme selection label
            Text(selectThemeText, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            // Theme selection buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildThemeButton(const Color(0xFFC3F9FF), "Color 1"),
                const SizedBox(width: 20),
                _buildThemeButton(const Color(0xFFC0D7FF), "Color 2"),
                const SizedBox(width: 20),
              ],
            ),

            const SizedBox(height: 40),

            // Language selection label
            Text(selectLanguageText, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            // Language selection buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLanguageButton("English"),
                const SizedBox(width: 20),
                _buildLanguageButton("Filipino"),
              ],
            ),

            const SizedBox(height: 40),

            // Save changes button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                backgroundColor: backgroundModel.buyBtn,
              ),
              onPressed: () {
                if (selectedThemeColor != null && selectedLanguage != null) {
                  // Apply selected theme based on color
                  backgroundModel.setThemeColor(selectedThemeColor!);

                  // Set selected language
                  languageModel.setLanguage(selectedLanguage!);

                  // Show confirmation SnackBar after state updates
                  Future.delayed(Duration.zero, () {
                    final updatedLang = Provider.of<LanguageModel>(
                      context,
                      listen: false,
                    );
                    final confirmationText =
                        updatedLang.isFilipino()
                            ? "Mga pagbabago ay na-save!"
                            : "Changes saved!";

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(confirmationText)));
                  });
                } else {
                  // Show error if selections are missing
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(missingSelectionText)));
                }
              },
              child: Text(saveChangesText),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build theme selection buttons
  Widget _buildThemeButton(Color color, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedThemeColor = color;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        side:
            selectedThemeColor == color
                ? const BorderSide(color: Colors.black, width: 2)
                : BorderSide.none,
      ),
      child: Text(label),
    );
  }

  // Helper to build language selection buttons
  Widget _buildLanguageButton(String lang) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedLanguage = lang;
        });
      },
      style: ElevatedButton.styleFrom(
        side:
            selectedLanguage == lang
                ? const BorderSide(color: Colors.black, width: 2)
                : BorderSide.none,
      ),
      child: Text(lang),
    );
  }
}
