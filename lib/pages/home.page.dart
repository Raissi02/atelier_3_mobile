import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  Future<void> _Deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.pushNamedAndRemoveUntil(context, '/inscription', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Home')),
      body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  _Deconnexion(context);
                },
                child: Text('Déconnexion', style: TextStyle(fontSize: 22))),
          )),
    );
  }
}