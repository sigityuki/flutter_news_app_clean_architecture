import 'package:get_it/get_it.dart';
import 'package:news_clean_architecture/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import 'package:news_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecases/delete_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());

  // datasource
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<DeleteArticleUseCase>(DeleteArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  // bloc
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(sl(), sl(), sl()));
}
