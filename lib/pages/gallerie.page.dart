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
      appBar: AppBar(
        title: Text('Gallerie'),
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
                  controller: txt_keyword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.purple[700]),
                    hintText: "Keyword",
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
                    _onGetGallerieDetails(context);
                  },
                  child: Text('Chercher', style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}