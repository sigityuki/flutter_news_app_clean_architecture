import 'package:news_clean_architecture/features/daily_news/domain/usecases/delete_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:bloc/bloc.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  LocalArticlesBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._deleteArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticle>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(GetSavedArticle event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(RemoveArticle removeArticle, Emitter<LocalArticlesState> emit) async {
    await _deleteArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticle saveArticle, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
