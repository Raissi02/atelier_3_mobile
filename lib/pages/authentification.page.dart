import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  Future<void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String savedLogin = prefs.getString("login") ?? "";
    String savedPassword = prefs.getString("password") ?? "";

    if (txt_login.text == savedLogin && txt_password.text == savedPassword) {
      prefs.setBool("connecte", true);
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar = SnackBar(
        content: Text('Identifiant ou mot de passe incorrect'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Authentification')),
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
                  _onAuthentifier(context);
                },
                child: Text('Connexion', style: TextStyle(fontSize: 22))),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inscription');
              },
              child: Text("Nouvel Utilisateur")
          )
        ],
      ),
    );
  }
}