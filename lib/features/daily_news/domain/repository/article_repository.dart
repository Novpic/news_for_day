import 'package:news_for_day/features/daily_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods

  Future<void> insetArticle(ArticleEntity article);

  Future<void> deleteArticle(ArticleEntity article);

  Future<List<ArticleEntity>> getArticles();
}
