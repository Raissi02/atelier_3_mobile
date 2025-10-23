import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Home')),
      drawer: MyDrawer(),
      body: Center(
        child: Wrap(
          children: [
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/meteo.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/meteo');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/gallerie.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/gallerie');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/pays.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/pays');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/contact.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/parametres.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/parametres');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/meteo.png'), // You can change this image
              ),
              onTap: () {
                Navigator.pushNamed(context, '/meteo');
              },
            ),
          ],
        ),
      ),
    );
  }
}