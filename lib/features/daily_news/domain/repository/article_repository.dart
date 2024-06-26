import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  Future<List<ArticleEntity>> getSavedNewsArticles();

  Future<void> saveNewsArticle(ArticleEntity article);

  Future<void> deleteNewsArticle(ArticleEntity article);
}
