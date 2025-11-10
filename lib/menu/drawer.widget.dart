import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.email?.split('@')[0] ?? 'Utilisateur';

    return Drawer(
      child: Container(
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
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.purple[800]!,
                        Colors.purple[600]!,
                        Colors.purple[400]!,
                      ]
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/profil.png"),
                    radius: 32, // REDUCED: Smaller radius to fit better
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 8), // REDUCED: Less spacing
                  Flexible( // ADDED: Flexible widget to prevent overflow
                    child: Text(
                      username,
                      style: TextStyle(
                        fontSize: 16, // REDUCED: Smaller font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis, // ADDED: Handle long names
                    ),
                  ),
                  SizedBox(height: 4), // REDUCED: Less spacing
                  Flexible( // ADDED: Flexible widget for email
                    child: Text(
                      user?.email ?? '',
                      style: TextStyle(
                        fontSize: 12, // REDUCED: Smaller font size
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis, // ADDED: Handle long emails
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Accueil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.home, color: Colors.purple[700]),
              trailing: Icon(Icons.arrow_right, color: Colors.purple[700]),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home");
              },
            ),
            Divider(height: 2, color: Colors.purple[100]),
            ListTile(
              title: Text('Météo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.cloud, color: Colors.purple[700]),
              trailing: Icon(Icons.arrow_right, color: Colors.purple[700]),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/meteo");
              },
            ),
            Divider(height: 2, color: Colors.purple[100]),
            ListTile(
              title: Text('Gallerie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.photo_library, color: Colors.purple[700]),
              trailing: Icon(Icons.arrow_right, color: Colors.purple[700]),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/gallerie");
              },
            ),
            Divider(height: 2, color: Colors.purple[100]),
            ListTile(
              title: Text('Pays', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.flag, color: Colors.purple[700]),
              trailing: Icon(Icons.arrow_right, color: Colors.purple[700]),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/pays");
              },
            ),
            Divider(height: 2, color: Colors.purple[100]),
            ListTile(
              title: Text('Contact', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.contact_mail, color: Colors.purple[700]),
              trailing: Icon(Icons.arrow_right, color: Colors.purple[700]),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/contact");
              },
            ),
            Divider(height: 2, color: Colors.purple[100]),
            ListTile(
              title: Text('Paramètres', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.settings, color: Colors.purple[700]),
              trailing: Icon(Icons.arrow_right, color: Colors.purple[700]),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/parametres");
              },
            ),
            Divider(height: 2, color: Colors.purple[100]),
            ListTile(
              title: Text('Déconnexion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.red[700])),
              leading: Icon(Icons.logout, color: Colors.red[700]),
              trailing: Icon(Icons.arrow_right, color: Colors.red[700]),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/authentification',
                        (route) => false
                );
              },
            ),
            Divider(height: 2, color: Colors.purple[100]),
          ],
        ),
      ),
    );
  }
}