import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/pages/home/daily_news_view.dart';

import '../../../../../injection_container.dart';

class DailyNewsScreen extends StatelessWidget {
  const DailyNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
        create: (BuildContext context) => sl<RemoteArticleBloc>(),
        child: const DailyNewsView());
  }
}
