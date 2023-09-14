import 'package:get/get.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/services/news_service.dart';
class NewsController extends GetxController {
  NewsService newsService = NewsService();
  AppleNews appleNews=AppleNews();
  TeslaNews teslaNews=TeslaNews();
  TechCrunch techCrunch=TechCrunch();
  BusinessNews businessNews=BusinessNews();

  var NewsList = <Article>[].obs;
  var appleList=<Article>[].obs;
  var teslaList=<Article>[].obs;
  var businessList=<Article>[].obs;
  var techcrunchList=<Article>[].obs;

  var loading = true.obs;

  void getData() async {
    NewsApp news = await newsService.getItems();
    NewsList.addAll(news.articles);
    loading.value=false;
  }
  void getApple() async {
    NewsApp news1 = await appleNews.getItems();
    appleList.addAll(news1.articles);
    loading.value=false;
  }void getTesla() async {
    NewsApp news2 = await teslaNews.getItems();
    teslaList.addAll(news2.articles);
    loading.value=false;
  }
  void getBusiness() async {
    NewsApp news3 = await businessNews.getItems();
    print("news3");
    businessList.addAll(news3.articles);
    loading.value=false;
  }void getTechcrunch() async {
    NewsApp news4 = await techCrunch.getItems();
    techcrunchList.addAll(news4.articles);
    loading.value=false;
  }
}