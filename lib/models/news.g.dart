// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      newsData: (json['news_data'] as List<dynamic>?)
          ?.map((e) => NewsDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'news_data': instance.newsData,
    };

NewsDatum _$NewsDatumFromJson(Map<String, dynamic> json) => NewsDatum(
      title: json['title'] as String?,
      time: json['time'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NewsDatumToJson(NewsDatum instance) => <String, dynamic>{
      'title': instance.title,
      'time': instance.time,
      'image': instance.image,
    };
