// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stocks _$StocksFromJson(Map<String, dynamic> json) => Stocks(
      investData: (json['invest_data'] as List<dynamic>?)
          ?.map((e) => InvestDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StocksToJson(Stocks instance) => <String, dynamic>{
      'invest_data': instance.investData,
    };

InvestDatum _$InvestDatumFromJson(Map<String, dynamic> json) => InvestDatum(
      stockCode: json['stock_code'] as String?,
      stockName: json['stock_name'] as String?,
      stockPercent: json['stock_percent'] as String?,
      trends: json['trends'] as String?,
    );

Map<String, dynamic> _$InvestDatumToJson(InvestDatum instance) =>
    <String, dynamic>{
      'stock_code': instance.stockCode,
      'stock_name': instance.stockName,
      'stock_percent': instance.stockPercent,
      'trends': instance.trends,
    };
