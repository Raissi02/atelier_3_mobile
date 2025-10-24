import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MeteoDetailsPage extends StatefulWidget {
  String ville = "";

  MeteoDetailsPage(this.ville);

  @override
  State<MeteoDetailsPage> createState() => _MeteoDetailsPageState();
}

class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  Future<void> getMeteoData(String ville) async {
    print("Méteo de la ville de " + ville);
    String url = "https://api.openweathermap.org/data/2.5/forecast?q=${ville}&appid=488f07fa6dcdd2c4c5285c7cfc29dea8";
    await http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
        print(this.meteoData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Meteo Details ${widget.ville}')),
      body: meteoData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: meteoData['list'].length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue[50],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                          Text(
                              "${DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))} - ${meteoData['list'][index]['weather'][0]['description']}",
                              style: TextStyle(fontSize: 14)
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                      "${(meteoData['list'][index]['main']['temp'] - 273.15).toStringAsFixed(1)}°C",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}