import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_for_day/core/resources/data_state.dart';
import 'package:news_for_day/features/daily_news/domain/use_cases/get_news_articles_use_case.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetNewsArticlesUseCase _getNewsArticlesUseCase;
  RemoteArticleBloc(this._getNewsArticlesUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetRemoteArticles>(onGetRemoteArticles);
  }

  void onGetRemoteArticles(
      GetRemoteArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getNewsArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleSucess(articles: dataState.data!));
    }
    if (dataState is DataError) {
      emit(RemoteArticleError(error: dataState.error!));
    }
  }
}
