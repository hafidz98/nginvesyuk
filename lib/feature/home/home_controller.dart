import 'package:flutter/foundation.dart';
import 'package:nginvesyuk/feature/home/home_repository.dart';
import 'package:nginvesyuk/models/news.dart';

import '../../models/stocks.dart';
import '../../models/user.dart';

class HomeController {
  late final HomeRepository _homeRepository;
  User? userData;
  List<InvestDatum>? stocksData;
  List<NewsDatum>? newsData;

  HomeController(this._homeRepository);

  Future<void> getUserData() async{
    userData = await _homeRepository.fetchUser();
    if (kDebugMode) {
      print(userData);
    }
  }

  Future<void> getStockData() async{
    stocksData = await _homeRepository.fetchInvest();
    if (kDebugMode) {
      print(stocksData);
    }
  }

  Future<void> getNewsData() async{
    newsData = await _homeRepository.fetchNews();
  }
}