import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_for_day/core/resources/data_state.dart';
import 'package:news_for_day/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_for_day/features/daily_news/data/models/article.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl({required this.newsApiService});
  final NewsApiService newsApiService;

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
}
