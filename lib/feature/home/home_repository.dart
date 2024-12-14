import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:nginvesyuk/models/news.dart';
import 'package:nginvesyuk/models/stocks.dart';
import 'package:nginvesyuk/models/user.dart';

class HomeRepository {
  Future<User> fetchUser() async{
    final String response = await rootBundle.loadString('mock_data/user_data.json');
    final data = await json.decode(response);
    if (kDebugMode) {
      print('raw_Json: $data');
    }

    final userData = User.fromJson(data);
    if (kDebugMode) {
      print('user_data: ${userData.investorId}');
    }

    return userData;
  }

  Future<List<InvestDatum>?> fetchInvest() async{
    final String response = await rootBundle.loadString('mock_data/investment_data.json');
    final data = await json.decode(response);

    final stocksData = Stocks.fromJson(data).investData;
    if (kDebugMode) {
      print('user_data: ${stocksData?[0]}');
    }
    return stocksData;
  }

  Future<List<NewsDatum>?> fetchNews() async{
    final String response = await rootBundle.loadString('mock_data/news_data.json');
    final data = await json. decode(response);

    final newsData = News.fromJson(data).newsData;
    return newsData;
  }
}