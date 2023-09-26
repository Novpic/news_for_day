import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/domain/entities/article.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

import '../../../../../injection_container.dart';
import 'detail_news_view.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalNewsArticleBloc>(
        create: (BuildContext context) => sl<LocalNewsArticleBloc>(),
        child: DatailNewsView(article: article));
  }
}
