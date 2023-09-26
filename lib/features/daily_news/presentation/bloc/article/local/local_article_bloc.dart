import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/local/remote_article_state.dart';

import '../../../../domain/use_cases/delete_news_article_use_case.dart';
import '../../../../domain/use_cases/get_saved_news_articles_use_case.dart';
import '../../../../domain/use_cases/insert_news_articles_use_case.dart';
import 'local_article_event.dart';

class LocalNewsArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedNewsArticlesUseCase _getSavedLocalArticles;
  final DeleteNewsArticlesUseCase _deleteLocalArticles;
  final InsertNewsArticlesUseCase _insertLocalArticles;
  LocalNewsArticleBloc(this._getSavedLocalArticles, this._deleteLocalArticles,
      this._insertLocalArticles)
      : super(const LocalArticleLoading()) {
    on<GetSavedLocalArticles>(onGetSavedArticles);
    on<DeleteLocalArticles>(onDeleteArticle);
    on<InsertLocalArticles>(onInseertArticle);
  }

  Future<void> onGetSavedArticles(_, Emitter<LocalArticleState> emit) async {
    final dataState = await _getSavedLocalArticles.call();

    emit(LocalArticleDone(articles: dataState));
  }

  void onDeleteArticle(
      DeleteLocalArticles event, Emitter<LocalArticleState> emit) async {
    await _deleteLocalArticles.call(params: event.article);
    final articles = await _getSavedLocalArticles.call();
    emit(LocalArticleDone(articles: articles));
  }

  void onInseertArticle(
      InsertLocalArticles event, Emitter<LocalArticleState> emit) async {
    await _insertLocalArticles.call(params: event.article);
    final articles = await _getSavedLocalArticles.call();
    emit(LocalArticleDone(articles: articles));
  }
}
