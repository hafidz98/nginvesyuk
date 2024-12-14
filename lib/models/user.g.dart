// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      investorId: json['investor_id'] as String?,
      totalInvestment: (json['total_investment'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'investor_id': instance.investorId,
      'total_investment': instance.totalInvestment,
    };
