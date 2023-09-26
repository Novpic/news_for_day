import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

import '../../../domain/entities/article.dart';
import '../../bloc/article/local/local_article_event.dart';

class DatailNewsView extends StatelessWidget {
  const DatailNewsView({
    super.key,
    required this.article,
  });

  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              BlocProvider.of<LocalNewsArticleBloc>(context)
                  .add(InsertLocalArticles(article));
            },
          )
        ],
      ),
      body: Column(children: [
        Text(
          article.title ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              image: article.urlToImage != null
                  ? DecorationImage(
                      image: NetworkImage(article.urlToImage!),
                      fit: BoxFit.cover)
                  : null),
          child: article.urlToImage == null
              ? const Center(
                  child: Icon(Icons.sd_card_alert),
                )
              : null,
        ),
        const SizedBox(height: 10),
        Text(
          article.content ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ]),
    );
  }
}
