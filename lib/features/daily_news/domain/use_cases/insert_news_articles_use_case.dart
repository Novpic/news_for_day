import 'package:news_for_day/features/daily_news/domain/entities/article.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repository/article_repository.dart';

class InsertNewsArticlesUseCase implements UseCase<void, ArticleEntity> {
  InsertNewsArticlesUseCase({required this.articleRepository});
  final ArticleRepository articleRepository;
  @override
  Future<void> call({ArticleEntity? params}) {
    return articleRepository.insetArticle(params!);
  }
}
