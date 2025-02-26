import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:news/model/everything_model.dart';
import 'package:news/model/source_moddel.dart';
import 'package:news/repository/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  var logger = Logger();

  @override
  Future<EverythingModel> getNews(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "034b130b897d4557a63ec302e999c808", "sources": sourceId});
    http.Response res = await http.get(url);
    var json = jsonDecode(res.body);

    EverythingModel everythingModel = EverythingModel.fromJson(json);
    return everythingModel;
  }

  @override
  Future<SourceModel> getSources(String category) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "034b130b897d4557a63ec302e999c808", 'category': category});
    http.Response res = await http.get(url);
    var json = jsonDecode(res.body);
    SourceModel sourceModel = SourceModel.fromJson(json);
    logger.f(sourceModel);
    return sourceModel;
  }
}
