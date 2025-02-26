// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:news/model/everything_model.dart';

// class ApiEverything {
//   static Future<EverythingModel> getEverything(String sourceId) async {
//     Uri url = Uri.https("newsapi.org", "/v2/everything",
//         {"apiKey": "034b130b897d4557a63ec302e999c808", "sources": sourceId});
//     http.Response res = await http.get(url);
//     var json = jsonDecode(res.body);
//     print(json);
//     EverythingModel everythingModel = EverythingModel.fromJson(json);
//     return everythingModel;
//   }
// }
