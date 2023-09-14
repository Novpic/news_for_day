import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/pages/home/widgets/articles_tile.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../bloc/article/remote/remote_article_state.dart';

class DailyNewsView extends StatelessWidget {
  const DailyNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _Body(),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: const Text(
      'Daily News',
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.grey[50],
  );
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RemoteArticleError) {
          return Center(
              child: Text(state.error?.message ?? 'Something went wrong'));
        } else {
          return ListView.builder(
            itemCount: state.articles?.length,
            itemBuilder: (context, index) {
              return ArticleTile(article: state.articles![index]);
            },
          );
        }
      },
    );
  }
}
