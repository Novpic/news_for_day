import 'package:news_for_day/core/use_cases/use_case.dart';
import 'package:news_for_day/features/daily_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/article_repository.dart';

class GetNewsArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  GetNewsArticlesUseCase({required this.articleRepository});
  final ArticleRepository articleRepository;
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return articleRepository.getNewsArticles();
  }
}
