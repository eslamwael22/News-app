import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/listtile.dart';

class Newslistview extends StatelessWidget {
  List<ArticleModel> articles;

  Newslistview({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Listtile(articles[index]),
        itemCount: articles.length,
      ),
    );
  }
}
