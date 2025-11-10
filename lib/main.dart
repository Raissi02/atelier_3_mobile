import 'package:flutter/material.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/pays.page.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/parametres.page.dart';
import 'package:voyage/pages/meteo-details.page.dart';
import 'package:voyage/pages/gallerie-details.page.dart';
import 'package:firebase_core/firebase_core.dart';  // ADDED: Firebase Core
import 'package:firebase_auth/firebase_auth.dart';  // ADDED: Firebase Auth
import 'firebase_options.dart';  // ADDED: Firebase configuration

void main() async {  // MODIFIED: Make main function async
  WidgetsFlutterBinding.ensureInitialized();  // ADDED: Initialize Flutter binding
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);  // ADDED: Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => HomePage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/meteo': (context) => MeteoPage(),
    '/gallerie': (context) => GalleriePage(),
    '/pays': (context) => PaysPage(),
    '/contact': (context) => ContactPage(),
    '/parametres': (context) => ParametresPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: StreamBuilder<User?>(  // MODIFIED: Replace FutureBuilder with StreamBuilder
        stream: FirebaseAuth.instance.authStateChanges(),  // ADDED: Real-time auth state stream
        builder: (context, snapshot) {
          if (snapshot.hasData) {  // ADDED: Check if user is authenticated
            return HomePage();  // ADDED: User is logged in
          } else {
            return AuthentificationPage();  // ADDED: User is not logged in
          }
        },
      ),
    );
  }
}