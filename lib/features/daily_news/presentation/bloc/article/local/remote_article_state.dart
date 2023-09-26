import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object?> get props => [articles!];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone({required List<ArticleEntity> articles})
      : super(articles: articles);
}
