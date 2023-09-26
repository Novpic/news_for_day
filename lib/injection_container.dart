import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_for_day/features/daily_news/data/data_source/local/dao_database.dart';
import 'package:news_for_day/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_for_day/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_for_day/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_for_day/features/daily_news/domain/use_cases/delete_news_article_use_case.dart';
import 'package:news_for_day/features/daily_news/domain/use_cases/get_news_articles_use_case.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

import 'features/daily_news/domain/use_cases/get_saved_news_articles_use_case.dart';
import 'features/daily_news/domain/use_cases/insert_news_articles_use_case.dart';

final sl = GetIt.instance;

Future<void> initalDependencies() async {
  //Floor
  final database =
      await $FloorAppDataBase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDataBase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());
  // Dependencias
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(newsApiService: sl(), appDataBase: sl()));

  // Use Cases
  sl.registerSingleton<GetNewsArticlesUseCase>(
      GetNewsArticlesUseCase(articleRepository: sl()));
  sl.registerSingleton<DeleteNewsArticlesUseCase>(
      DeleteNewsArticlesUseCase(articleRepository: sl()));
  sl.registerSingleton<GetSavedNewsArticlesUseCase>(
      GetSavedNewsArticlesUseCase(articleRepository: sl()));
  sl.registerSingleton<InsertNewsArticlesUseCase>(
      InsertNewsArticlesUseCase(articleRepository: sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  sl.registerFactory<LocalNewsArticleBloc>(
      () => LocalNewsArticleBloc(sl(), sl(), sl()));
}
