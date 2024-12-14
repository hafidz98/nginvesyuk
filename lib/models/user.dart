import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "investor_id")
  String? investorId;
  @JsonKey(name: "total_investment")
  int? totalInvestment;

  User({
    this.username,
    this.password,
    this.name,
    this.investorId,
    this.totalInvestment,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

