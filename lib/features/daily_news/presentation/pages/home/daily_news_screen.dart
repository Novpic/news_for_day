import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNewsScreen extends StatelessWidget {
  const DailyNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
        );
      },
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: const Text('Daily News'),
  );
}
