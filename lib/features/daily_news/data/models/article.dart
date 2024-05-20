import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';

part 'article.g.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
@JsonSerializable()
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) =>
      _$ArticleModelFromJson(map);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
