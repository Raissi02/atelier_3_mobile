import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  Future<void> _onAuthentifier(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txt_login.text,
        password: txt_password.text,
      );
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      String message = "Identifiant ou mot de passe incorrect";
      if (e.code == 'user-not-found') {
        message = 'Aucun utilisateur trouvé avec cet email';
      } else if (e.code == 'wrong-password') {
        message = 'Mot de passe incorrect';
      }
      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.purple[600],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.purple[800]!,
                Colors.purple[600]!,
                Colors.purple[400]!,
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple[50]!,
              Colors.white,
              Colors.purple[50]!,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column( // CHANGED: Removed mainAxisAlignment
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: txt_login,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.purple[700]),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.purple[300]!),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple[700]!),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: txt_password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.purple[700]),
                    hintText: "Mot de passe",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.purple[300]!),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple[700]!),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[600],
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                    _onAuthentifier(context);
                  },
                  child: Text('Connexion', style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/inscription');
                },
                child: Text(
                  "Nouvel Utilisateur",
                  style: TextStyle(
                    color: Colors.purple[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}