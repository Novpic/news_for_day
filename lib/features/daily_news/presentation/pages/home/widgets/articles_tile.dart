import 'package:flutter/material.dart';

import '../../../../domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    //print(article.toString());
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: article.urlToImage != null
                    ? DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover)
                    : null),
          ),
        ],
      ),
    );
  }
}
