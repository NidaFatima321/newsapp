import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/view/news_page.dart';
// import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  final Article article;
  const NewsWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsPage(article: article),));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.urlToImage,),
            SizedBox(height: 20,),
            Text(article.source.name,style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: Text(article.title,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
              ),
            ),
            // Text(article.content,
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(
            //   fontSize: 20,
            //   // fontWeight: FontWeight.bold,
            //   fontFamily: 'SourceSansPro',
            //
            // ),),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(article.author.toUpperCase(),style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),),
                Text('${article.publishedAt}',style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
