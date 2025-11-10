import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:voyage/menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  Future<void> _Deconnexion(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/authentification', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Voyage App'),
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
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.email, size: 16, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  user?.email ?? 'Utilisateur',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MyDrawer(),
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
        child: Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildFeatureCard('images/meteo.png', () {
                Navigator.pushNamed(context, '/meteo');
              }),
              _buildFeatureCard('images/gallerie.png', () {
                Navigator.pushNamed(context, '/gallerie');
              }),
              _buildFeatureCard('images/pays.png', () {
                Navigator.pushNamed(context, '/pays');
              }),
              _buildFeatureCard('images/contact.png', () {
                Navigator.pushNamed(context, '/contact');
              }),
              _buildFeatureCard('images/parametres.png', () {
                Navigator.pushNamed(context, '/parametres');
              }),
              _buildFeatureCard('images/deconnexion.png', () {
                _Deconnexion(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String imagePath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 180,
        height: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}