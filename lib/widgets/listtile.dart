import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class Listtile extends StatelessWidget {
  const Listtile(this.article, {super.key});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: article.image != null
              ? Image.network(
                  article.image!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1768889098025-42a200b21e4d?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        SizedBox(height: 8),
        Text(
          article.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        Text(
          article.description != null
              ? article.description!
              : 'Error No Description Found For This Article and this is the description ............',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
