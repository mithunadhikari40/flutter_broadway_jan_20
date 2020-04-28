import 'package:flutter_news_app_bloc/src/models/item_model.dart';

abstract class Sources{
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
  Future<int> insertItem(ItemModel item);
}
