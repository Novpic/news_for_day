import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_for_day/features/daily_news/domain/entities/article.dart';

class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading() : super(articles: null, error: null);
}

class RemoteArticleSucess extends RemoteArticleState {
  const RemoteArticleSucess({required List<ArticleEntity> articles})
      : super(articles: articles, error: null);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError({required DioException error})
      : super(articles: null, error: error);
}
