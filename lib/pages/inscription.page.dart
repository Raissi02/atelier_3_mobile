import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InscriptionPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  Future<void> _onInscrire(BuildContext context) async {
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txt_login.text,
          password: txt_password.text,
        );
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        String message = "Erreur d'inscription";
        if (e.code == 'weak-password') {
          message = 'Le mot de passe est trop faible';
        } else if (e.code == 'email-already-in-use') {
          message = 'Un compte existe déjà avec cet email';
        }

        final snackBar = SnackBar(
          content: Text(message),
          backgroundColor: Colors.purple[600],
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      final snackBar = SnackBar(
        content: Text('Email ou mot de passe vides'),
        backgroundColor: Colors.purple[600],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
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
          child: Column(
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
                    _onInscrire(context);
                  },
                  child: Text('Inscription', style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/authentification');
                },
                child: Text(
                  "Déjà inscrit? Se connecter",
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