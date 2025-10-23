import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Contact')),
      body: Center(
        child: Text('Page Contact', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}