import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

import '../../../../domain/use_cases/delete_news_article_use_case.dart';
import '../../../../domain/use_cases/get_saved_news_articles_use_case.dart';
import '../../../../domain/use_cases/insert_news_articles_use_case.dart';
import 'local_article_event.dart';

class LocalNewsArticleBloc
    extends Bloc<LocalArticleEvent, LocalArticleNewsState> {
  final GetSavedNewsArticlesUseCase _getSavedLocalArticles;
  final DeleteNewsArticlesUseCase _deleteLocalArticles;
  final InsertNewsArticlesUseCase _insertLocalArticles;
  LocalNewsArticleBloc(this._getSavedLocalArticles, this._deleteLocalArticles,
      this._insertLocalArticles)
      : super(const LocalArticleNewsLoading()) {
    on<GetSavedLocalArticles>(onGetSavedArticles);
    on<DeleteLocalArticles>(onDeleteArticle);
    on<InsertLocalArticles>(onInseertArticle);
  }

  Future<void> onGetSavedArticles(
      _, Emitter<LocalArticleNewsState> emit) async {
    final dataState = await _getSavedLocalArticles.call();

    emit(LocalArticleNewsDone(articles: dataState));
  }

  void onDeleteArticle(
      DeleteLocalArticles event, Emitter<LocalArticleNewsState> emit) async {
    await _deleteLocalArticles.call(params: event.article);
    final articles = await _getSavedLocalArticles.call();
    emit(LocalArticleNewsDone(articles: articles));
  }

  void onInseertArticle(
      InsertLocalArticles event, Emitter<LocalArticleNewsState> emit) async {
    await _insertLocalArticles.call(params: event.article);
    final articles = await _getSavedLocalArticles.call();
    emit(LocalArticleNewsDone(articles: articles));
  }
}
