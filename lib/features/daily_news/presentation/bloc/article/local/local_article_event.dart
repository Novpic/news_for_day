import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article!];
}

class GetSavedLocalArticles extends LocalArticleEvent {
  const GetSavedLocalArticles();
}

class DeleteLocalArticles extends LocalArticleEvent {
  const DeleteLocalArticles(ArticleEntity article) : super(article: article);
}

class InsertLocalArticles extends LocalArticleEvent {
  const InsertLocalArticles(ArticleEntity article) : super(article: article);
}
