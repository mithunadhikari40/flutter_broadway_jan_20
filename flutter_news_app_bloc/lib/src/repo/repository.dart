import 'package:flutter_news_app_bloc/src/models/item_model.dart';
import 'package:flutter_news_app_bloc/src/repo/api_provider.dart';
import 'package:flutter_news_app_bloc/src/repo/db_provider.dart';
import 'package:flutter_news_app_bloc/src/repo/sources.dart';

class Repository {
  List<Sources> sources = [
    DbProvider(),
    ApiProvider(),
  ];

  fetchTopIds() async {
    return await sources[1].fetchTopIds();
  }

  fetchItem(int id) async {
    // see if local db had an item with this id
    //if yes return from here
    //else get that item from api
    //store that item into local db for future use
    //return that item

    ItemModel item;
    var source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var origin in sources) {
      //if the data is retrived from the local db or not
      //if yes then skip insertion into local db
      if (source != origin) {
        origin.insertItem(item);
      }
    }
    return item;
  }
}
