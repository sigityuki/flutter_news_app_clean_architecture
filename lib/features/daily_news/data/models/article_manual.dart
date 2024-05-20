// import 'package:floor/floor.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:news_clean_architecture/core/resources/null_to_empty_string_converter.dart';
// import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';

// part 'article.g.dart';

// @Entity(tableName: 'article', primaryKeys: ['id'])
// @JsonSerializable()
// @NullToEmptyStringConverter()
// class ArticleModel extends ArticleEntity {
//   const ArticleModel({
//     int? id,
//     String? author,
//     String? title,
//     String? description,
//     String? url,
//     String? urlToImage,
//     String? publishedAt,
//     String? content,
//   }) : super();

//   factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

//   factory ArticleModel.fromEntity(ArticleEntity entity) {
//     return ArticleModel(
//         id: entity.id,
//         author: entity.author,
//         title: entity.title,
//         description: entity.description,
//         url: entity.url,
//         urlToImage: entity.urlToImage,
//         publishedAt: entity.publishedAt,
//         content: entity.content);
//   }
// }
