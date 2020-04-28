import 'dart:convert';
import 'package:flutter_news_app_bloc/src/core/constants.dart';
import 'package:flutter_news_app_bloc/src/models/item_model.dart';
import 'package:flutter_news_app_bloc/src/repo/sources.dart';
import 'package:http/http.dart';

class ApiProvider extends Sources {
  Client client = Client();
  @override
  fetchTopIds() async {
    final response = await client.get("$BASE_URL/topstories.json");
    final ids = jsonDecode(response.body);
    return ids;
  }

  @override
  fetchItem(int id) async {
    final response = await client.get("$BASE_URL/item/$id.json");
    final parsedJson = jsonDecode(response.body);
    return ItemModel.fromJson(parsedJson);
  }

  @override
  Future<int> insertItem(ItemModel item) {
    return null;
  }
}
