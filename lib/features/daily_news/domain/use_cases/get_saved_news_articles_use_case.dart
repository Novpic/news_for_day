import 'package:news_for_day/features/daily_news/domain/entities/article.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repository/article_repository.dart';

class GetSavedNewsArticlesUseCase
    implements UseCase<List<ArticleEntity>, void> {
  GetSavedNewsArticlesUseCase({required this.articleRepository});
  final ArticleRepository articleRepository;
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return articleRepository.getArticles();
  }
}
