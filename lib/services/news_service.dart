import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_model.dart';

class NewsService {
  Future<NewsApp> getItems() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f285d7ec4b214cb1ad468ffa91851729'),
      );
      // print(response.body);
      NewsApp news = newsAppFromJson(response.body);
      return news;
    } finally {
      client.close();
    }
  }
}