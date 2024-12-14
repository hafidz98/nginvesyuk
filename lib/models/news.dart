import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  @JsonKey(name: "news_data")
  List<NewsDatum>? newsData;

  News({
    this.newsData,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class NewsDatum {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "image")
  String? image;

  NewsDatum({
    this.title,
    this.time,
    this.image,
  });

  factory NewsDatum.fromJson(Map<String, dynamic> json) => _$NewsDatumFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDatumToJson(this);
}
