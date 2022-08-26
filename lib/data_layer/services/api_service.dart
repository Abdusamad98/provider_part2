import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;
import 'package:provider_part2/data_layer/models/currency_item.dart';
import 'package:provider_part2/data_layer/models/user_data.dart';

class ApiService {
   Future<List<CurrencyItem>> getCurrencyList() async {
    try {
      Response response =
          await https.get(Uri.parse("https://nbu.uz/uz/exchange-rates/json/"));
      if (response.statusCode == 200) {
        List<CurrencyItem> currencyItems = (jsonDecode(response.body) as List?)
                ?.map((e) => CurrencyItem.fromJson(e))
                .toList() ??
            [];
        return currencyItems;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

   Future<UserData> getUserData() async {
    try {
      Response response =
      await https.get(Uri.parse("https://api.agify.io/?name=bella"));
      if (response.statusCode == 200) {
        UserData userData = UserData.fromJson(jsonDecode(response.body));
        debugPrint(userData.name);
        return userData;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
