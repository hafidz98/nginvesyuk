import 'package:json_annotation/json_annotation.dart';

part 'stocks.g.dart';

@JsonSerializable()
class Stocks {
  @JsonKey(name: "invest_data")
  List<InvestDatum>? investData;

  Stocks({
    this.investData,
  });

  factory Stocks.fromJson(Map<String, dynamic> json) => _$StocksFromJson(json);

  Map<String, dynamic> toJson() => _$StocksToJson(this);
}

@JsonSerializable()
class InvestDatum {
  @JsonKey(name: "stock_code")
  String? stockCode;
  @JsonKey(name: "stock_name")
  String? stockName;
  @JsonKey(name: "stock_percent")
  String? stockPercent;
  @JsonKey(name: "trends")
  String? trends;

  InvestDatum({
    this.stockCode,
    this.stockName,
    this.stockPercent,
    this.trends,
  });

  factory InvestDatum.fromJson(Map<String, dynamic> json) => _$InvestDatumFromJson(json);

  Map<String, dynamic> toJson() => _$InvestDatumToJson(this);
}
