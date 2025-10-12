import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_password.text);
      prefs.setBool("connecte", true);
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar = SnackBar(
        content: Text('Id ou mot de passe vides'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Inscription')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Utilisateur",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_password,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Mot de passe",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size.fromHeight(50)),
                onPressed: () {
                  _onInscrire(context);
                },
                child: Text('Inscription', style: TextStyle(fontSize: 22))),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/authentification');
              },
              child: Text("Déjà inscrit? Se connecter")
          )
        ],
      ),
    );
  }
}