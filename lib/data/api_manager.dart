// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:news/model/source_moddel.dart';

// class ApiManager {
//   static Future<SourceModel> getSources(String category) async {
//     Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
//         {"apiKey": "034b130b897d4557a63ec302e999c808", 'category': category});
//     http.Response res = await http.get(url);
//     var json = jsonDecode(res.body);
//     SourceModel sourceModel = SourceModel.fromJson(json);
//     return sourceModel;
//   }
// }
