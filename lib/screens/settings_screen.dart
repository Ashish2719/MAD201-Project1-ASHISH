/*
  MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  App settings screen (theme/currency)
*/
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String currency = "USD";
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  Future<void> loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currency = prefs.getString("currency") ?? "USD";
      isDark = prefs.getBool("isDark") ?? false;
    });
  }

  Future<void> savePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("currency", currency);
    await prefs.setBool("isDark", isDark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Column(
        children: [
          ListTile(
            title: const Text("Currency"),
            trailing: DropdownButton(
              value: currency,
              items: ["USD", "CAD"]
                  .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  currency = v as String;
                });
                savePrefs();
              },
            ),
          ),
          SwitchListTile(
            title: const Text("Dark Theme"),
            value: isDark,
            onChanged: (v) {
              setState(() {
                isDark = v;
              });
              savePrefs();
            },
          ),
        ],
      ),
    );
  }
}
