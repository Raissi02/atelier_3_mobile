import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GallerieDetailsPage extends StatefulWidget {
  final String keyword;

  GallerieDetailsPage({required this.keyword});

  @override
  _GallerieDetailsPageState createState() => _GallerieDetailsPageState();
}

class _GallerieDetailsPageState extends State<GallerieDetailsPage> {
  int currentPage = 1;
  int size = 10;
  int totalPages = 0;
  ScrollController scrollController = ScrollController();
  List<dynamic> hits = [];
  var galleryData;

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.keyword);
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGalleryData(widget.keyword);
        }
      }
    });
  }

  Future<void> getGalleryData(String keyword) async {
    String url = "https://pixabay.com/api/?key=53035024-8fbba61fe73ec3c664231ad28&q=$keyword&page=$currentPage&per_page=$size";

    var response = await http.get(Uri.parse(url));

    setState(() {
      galleryData = json.decode(response.body);
      hits.addAll(galleryData['hits']);
      totalPages = (galleryData['totalHits'] / size).ceil();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPages == 0
            ? Text('Pas de résultats')
            : Text("${widget.keyword}, Page ${currentPage} / ${totalPages}"),
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
        child: galleryData == null
            ? Center(child: CircularProgressIndicator(color: Colors.purple[700]))
            : ListView.builder(
          itemCount: hits.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          hits[index]['tags'],
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    color: Colors.purple[600], // CHANGED: Blue to purple
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        hits[index]['webformatURL'],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                                color: Colors.purple[700],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}