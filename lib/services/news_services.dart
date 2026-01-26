import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      final normalizedCategory = category.trim().toLowerCase();
      final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=96a594a444bd4252937b749211f57bde&category=$normalizedCategory',
      );
      // vaviable to store json data
      Map<String, dynamic> JsonData = response.data;
      List<dynamic> articles = JsonData['articles'];
      List<ArticleModel> news = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          title: article['title'],
          description: article['description'],
          image: article['urlToImage'],
        );
        news.add(articleModel);
      }
      return news;
    } on Exception catch (e) {
      return [];
    }
  }
}
