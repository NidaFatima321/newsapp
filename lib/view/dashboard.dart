import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/view/news_widget.dart';

class NewsDashboard extends StatefulWidget {
  final String type;
  const NewsDashboard({Key? key, required this.type}) : super(key: key);
  @override
  State<NewsDashboard> createState() => _NewsDashboardState();
}

class _NewsDashboardState extends State<NewsDashboard> {
  NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return newsController.loading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            shrinkWrap: true,
            itemCount: newsController.NewsList.length,
            itemBuilder: (context, index) {
              if(widget.type=="allnews"){
                return NewsWidget(article: newsController.NewsList[index],);
              }
              else if(widget.type=="business"){
                return NewsWidget(article: newsController.businessList[index],);
              }else if(widget.type=="apple"){
                return NewsWidget(article: newsController.appleList[index],);
              }else if(widget.type=="techcrunch"){
                return NewsWidget(article: newsController.techcrunchList[index],);
              }else if(widget.type=="tesla"){
                return NewsWidget(article: newsController.teslaList[index],);
              }
              },);
        }));
  }
}
