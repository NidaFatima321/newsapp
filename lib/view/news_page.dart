import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final Article article;
  const NewsPage({Key? key, required this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.share),
            Icon(Icons.bookmark),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(article.source.name, style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  ),),
                ),
                Text("${article.publishedAt}", style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Text(article.title, style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Merriweather"
              ),),
            ),
            Image.network(article.urlToImage),
            Text(article.description + "...",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async{
                    if(!await launchUrl(Uri.parse(article.url))){
                    throw Exception('Could not launch $article.url');
                    }
                  },
                  child: Text("Read More", style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 20
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

