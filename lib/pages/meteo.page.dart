import 'package:flutter/material.dart';

class MeteoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Météo')),
      body: Center(
        child: Text('Page Météo', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}