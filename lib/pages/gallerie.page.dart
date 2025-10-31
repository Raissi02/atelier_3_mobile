import 'package:flutter/material.dart';
import 'package:voyage/pages/gallerie-details.page.dart';

class GalleriePage extends StatelessWidget {
  TextEditingController txt_keyword = TextEditingController();

  Future<void> _onGetGallerieDetails(BuildContext context) async {
    if (txt_keyword.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GallerieDetailsPage(keyword: txt_keyword.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Gallerie')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_keyword,
              decoration: InputDecoration(
                  hintText: "Keyword",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50)
                ),
                onPressed: () {
                  _onGetGallerieDetails(context);
                },
                child: Text('Chercher', style: TextStyle(fontSize: 22))
            ),
          )
        ],
      ),
    );
  }
}