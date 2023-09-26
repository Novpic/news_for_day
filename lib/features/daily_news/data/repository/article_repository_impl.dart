import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_for_day/core/resources/data_state.dart';
import 'package:news_for_day/features/daily_news/data/data_source/local/dao_database.dart';
import 'package:news_for_day/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_for_day/features/daily_news/data/models/article.dart';
import 'package:news_for_day/features/daily_news/domain/entities/article.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl({
    required this.newsApiService,
    required this.appDataBase,
  });
  final NewsApiService newsApiService;
  final AppDataBase appDataBase;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(
          DioException(
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusCode,
            response: httpResponse.response,
          ),
        );
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticleEntity article) async {
    return appDataBase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<List<ArticleEntity>> getArticles() {
    return appDataBase.articleDao.getArticles();
  }

  @override
  Future<void> insetArticle(ArticleEntity article) {
    return appDataBase.articleDao
        .insetArticle(ArticleModel.fromEntity(article));
  }
}
