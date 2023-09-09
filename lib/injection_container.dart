import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_for_day/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_for_day/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_for_day/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_for_day/features/daily_news/domain/use_cases/get_news_articles_use_case.dart';
import 'package:news_for_day/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initalDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());
  // Dependencias
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(newsApiService: sl()));

  // Use Cases
  sl.registerSingleton<GetNewsArticlesUseCase>(
      GetNewsArticlesUseCase(articleRepository: sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
