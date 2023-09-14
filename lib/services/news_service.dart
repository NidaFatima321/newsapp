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

class TeslaNews {
  Future<NewsApp> getItems() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=tesla&from=2023-08-14&sortBy=publishedAt&apiKey=f285d7ec4b214cb1ad468ffa91851729'),
      );
      // print(response.body);
      NewsApp news1 = newsAppFromJson(response.body);
      return news1;
    } finally {
      client.close();
    }
  }
}

class AppleNews {
  Future<NewsApp> getItems() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=apple&from=2023-09-13&to=2023-09-13&sortBy=popularity&apiKey=f285d7ec4b214cb1ad468ffa91851729'),
      );
      // print(response.body);
      NewsApp news2 = newsAppFromJson(response.body);
      return news2;
    } finally {
      client.close();
    }
  }
}

class BusinessNews {
  Future<NewsApp> getItems() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
            'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f285d7ec4b214cb1ad468ffa91851729'),
      );
      // print(response.body);
      NewsApp news3 = newsAppFromJson(response.body);
      return news3;
    } finally {
      client.close();
    }
  }
}class TechCrunch {
  Future<NewsApp> getItems() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
            'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f285d7ec4b214cb1ad468ffa91851729'),
      );
      // print(response.body);
      NewsApp news4 = newsAppFromJson(response.body);
      return news4;
    } finally {
      client.close();
    }
  }
}