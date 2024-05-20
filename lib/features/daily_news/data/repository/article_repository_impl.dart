import 'dart:io';

import 'package:news_clean_architecture/core/constants/constants.dart';
import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(apiKey: apiKey, country: countryQuery, category: categoryQuery);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> deleteNewsArticle(ArticleEntity article) {
    return _appDatabase.articleDao.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveNewsArticle(ArticleEntity article) {
    return _appDatabase.articleDao.insertArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<List<ArticleEntity>> getSavedNewsArticles() {
    return _appDatabase.articleDao.getArticless();
  }
}
