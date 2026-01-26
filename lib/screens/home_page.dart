import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/categorieslistview.dart';
import 'package:news_app/widgets/newslistview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'App',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: SizedBox(height: 100, child: categorieslistview()),
            ),
          ),
          SliverToBoxAdapter(child: NewsListViewBuilder(category: 'general')),
        ],
      ),
    );
  }
}

class NewsListViewBuilder extends StatefulWidget {
  final String category;
  NewsListViewBuilder({required this.category});
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var feture;
  void initState() {
    super.initState();
    feture = NewsServices(Dio()).getNews(category: widget.category);
  }

  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: feture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Newslistview(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(child: Text('oops! something went wrong'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
