import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/categorieslistview.dart';
import 'package:news_app/widgets/listtile.dart';

class Newslistview extends StatefulWidget {
  const Newslistview({super.key});

  @override
  State<Newslistview> createState() => _NewslistviewState();
}

class _NewslistviewState extends State<Newslistview> {
  List<ArticleModel> articles = [];

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsServices(Dio()).getNews(category: 'general');
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          Container(height: 100, child: categorieslistview()),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Listtile(articles[index]),
            itemCount: articles.length,
          ),
        ],
      ),
    );
  }
}
