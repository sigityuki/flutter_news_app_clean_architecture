// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'article.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
//       id: (json['id'] as num?)?.toInt(),
//       author: const NullToEmptyStringConverter().fromJson(json['author']),
//       title: const NullToEmptyStringConverter().fromJson(json['title']),
//       description:
//           const NullToEmptyStringConverter().fromJson(json['description']),
//       url: const NullToEmptyStringConverter().fromJson(json['url']),
//       urlToImage:
//           const NullToEmptyStringConverter().fromJson(json['urlToImage']),
//       publishedAt:
//           const NullToEmptyStringConverter().fromJson(json['publishedAt']),
//       content: const NullToEmptyStringConverter().fromJson(json['content']),
//     );

// Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'author': _$JsonConverterToJson<dynamic, String>(
//           instance.author, const NullToEmptyStringConverter().toJson),
//       'title': _$JsonConverterToJson<dynamic, String>(
//           instance.title, const NullToEmptyStringConverter().toJson),
//       'description': _$JsonConverterToJson<dynamic, String>(
//           instance.description, const NullToEmptyStringConverter().toJson),
//       'url': _$JsonConverterToJson<dynamic, String>(
//           instance.url, const NullToEmptyStringConverter().toJson),
//       'urlToImage': _$JsonConverterToJson<dynamic, String>(
//           instance.urlToImage, const NullToEmptyStringConverter().toJson),
//       'publishedAt': _$JsonConverterToJson<dynamic, String>(
//           instance.publishedAt, const NullToEmptyStringConverter().toJson),
//       'content': _$JsonConverterToJson<dynamic, String>(
//           instance.content, const NullToEmptyStringConverter().toJson),
//     };

// Json? _$JsonConverterToJson<Json, Value>(
//   Value? value,
//   Json? Function(Value value) toJson,
// ) =>
//     value == null ? null : toJson(value);
