import 'package:get/get.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/services/news_service.dart';
class NewsController extends GetxController {
  NewsService newsService = NewsService();
  var NewsList = <Article>[].obs;
  var loading = true.obs;
  void getData() async {
    NewsApp news = await newsService.getItems();
    NewsList.addAll(news.articles);
    loading.value=false;
  }
}