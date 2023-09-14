import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    //print(article.toString());
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                image: article.urlToImage != null
                    ? DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover)
                    : null),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        article.content ?? '',
                        maxLines: 4,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: Colors.grey[500],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            DateFormat('yMMMMEEEEd')
                                .format(DateTime.parse(article.publishedAt!)),
                            style: theme.textTheme.labelMedium,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
