import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class categorieslistview extends StatelessWidget {
  categorieslistview({super.key});
  final List<CategoryModel> categories = [
    CategoryModel(categoryName: 'Business', imageUrl: 'assets/business.avif'),
    CategoryModel(
      categoryName: 'Entertainment',
      imageUrl: 'assets/entertaiment.avif',
    ),
    CategoryModel(categoryName: 'General', imageUrl: 'assets/general.avif'),
    CategoryModel(categoryName: 'Health', imageUrl: 'assets/health.avif'),
    CategoryModel(categoryName: 'Science', imageUrl: 'assets/science.avif'),
    CategoryModel(categoryName: 'Sports', imageUrl: 'assets/sports.avif'),
    CategoryModel(
      categoryName: 'Technology',
      imageUrl: 'assets/technology.jpeg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3),
          child: CategoryCard(category: categories[index]),
        );
      },
      itemCount: categories.length,
    );
  }
}
