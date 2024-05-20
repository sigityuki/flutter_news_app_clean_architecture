import 'package:news_clean_architecture/core/constants/constants.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<ArticleResponse>> getNewsArticle({
    @Field("articles") @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}

@JsonSerializable()
class ArticleResponse {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;
  ArticleResponse(this.status, this.totalResults, this.articles);

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
