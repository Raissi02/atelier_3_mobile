import 'package:flutter/material.dart';

class GalleriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Gallerie')),
      body: Center(
        child: Text('Page Gallerie', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}