import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/view/news_widget.dart';

class NewsDashboard extends StatefulWidget {
  const NewsDashboard({Key? key}) : super(key: key);
  @override
  State<NewsDashboard> createState() => _NewsDashboardState();
}

class _NewsDashboardState extends State<NewsDashboard> {
  NewsController newsController = Get.put(NewsController());
  @override
  void initState() {
    super.initState();
    newsController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WELCOME TO THE NEWS BOARD'),
        ),
        body: Obx(() {
          return newsController.loading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            shrinkWrap: true,
            itemCount: newsController.NewsList.length,
            itemBuilder: (context, index) {
                return NewsWidget(article: newsController.NewsList[index],);
              },);
        }));
  }
}
