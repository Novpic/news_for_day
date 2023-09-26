import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

class LocalArticleNewsState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleNewsState({this.articles});

  @override
  List<Object?> get props => [articles!];
}

class LocalArticleNewsLoading extends LocalArticleNewsState {
  const LocalArticleNewsLoading();
}

class LocalArticleNewsDone extends LocalArticleNewsState {
  const LocalArticleNewsDone({required List<ArticleEntity> articles})
      : super(articles: articles);
}
