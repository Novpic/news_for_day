import 'package:news_for_day/core/resources/data_state.dart';
import 'package:news_for_day/features/daily_news/data/models/article.dart';

import 'package:news_for_day/features/daily_news/domain/entities/article.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
