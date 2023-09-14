import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/view/dashboard.dart';
import 'package:newsapp/view/grid_widget.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController=PageController();
  NewsController newsController = Get.put(NewsController());
  @override
  void initState() {
    super.initState();
    newsController.getData();
    newsController.getApple();
    newsController.getBusiness();
    newsController.getTechcrunch();
    newsController.getTesla();
  }
  void function1(types){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsDashboard(type: types),));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Row(
            children: [
              Text('NEWSROOM',style: TextStyle(
              ),)
              ]
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          padding: EdgeInsets.all(8),
          crossAxisSpacing: 20.0,
          children: [
            GestureDetector(
                onTap: (){function1('allnews');},
                child: GridWidget(image: 'assets/images/news.jfif',name: "ALL NEWS",
                )
            ),
            GestureDetector(
                onTap: (){function1('business');},
                child: GridWidget(image: 'assets/images/business.jfif',name: "BUSINESS",)),
            GestureDetector(
                onTap: (){function1('tesla');},
                child: GridWidget(image: 'assets/images/tesla.jfif',name: "TESLA",)),
            GestureDetector(
                onTap: (){function1('apple');},
                child: GridWidget(image: 'assets/images/apple.jfif',name: "APPLE",)),
            GestureDetector(
                onTap: (){function1('techcrunch');},
                child: GridWidget(image: 'assets/images/techcrunch.jfif',name: "FROM TECH CRUNCH",)),
          ],
        ),
      )
    );
  }
}
