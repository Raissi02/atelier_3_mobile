import 'package:flutter/material.dart';
import 'meteo-details.page.dart';

class MeteoPage extends StatelessWidget {
  TextEditingController txt_ville = TextEditingController();

  void _onGetMeteoDetails(BuildContext context) {
    String v = txt_ville.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MeteoDetailsPage(v)));
    txt_ville.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Météo'),
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
        child: Padding( // CHANGED: Removed Center widget and used Padding directly
          padding: EdgeInsets.all(20),
          child: Column(
            children: [ // CHANGED: Removed mainAxisAlignment
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: txt_ville,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city, color: Colors.purple[700]),
                    hintText: "Ville",
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
                    _onGetMeteoDetails(context);
                  },
                  child: Text('Chercher', style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}