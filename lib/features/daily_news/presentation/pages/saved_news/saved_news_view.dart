import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:news_for_day/features/daily_news/presentation/pages/saved_news/widgets/saved_article_tile.dart';

class SavedNewsView extends StatelessWidget {
  const SavedNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalNewsArticleBloc, LocalArticleNewsState>(
        builder: (context, state) {
      if (state is LocalArticleNewsLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is LocalArticleNewsDone) {
        return ListView.builder(
          itemCount: state.articles?.length,
          itemBuilder: (context, index) {
            return SavedArticleTile(
              article: state.articles![index],
            );
          },
        );
      } else {
        return const Center(child: Text('Something went wrong'));
      }
    });
  }
}
