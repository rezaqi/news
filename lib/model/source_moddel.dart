import 'package:news/model/source_model_hive.dart';

class SourceModel {
  String? status;
  List<SourceModelHive>? sources;

  SourceModel({this.status, this.sources});

  SourceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <SourceModelHive>[];
      json['sources'].forEach((v) {
        sources!.add(new SourceModelHive.fromJson(v));
      });
    }
  }
}

// class Sources {
//   String? id;
//   String? name;
//   String? description;
//   String? url;
//   String? category;
//   String? language;
//   String? country;

//   Sources(
//       {this.id,
//       this.name,
//       this.description,
//       this.url,
//       this.category,
//       this.language,
//       this.country});

//   Sources.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     url = json['url'];
//     category = json['category'];
//     language = json['language'];
//     country = json['country'];
//   }
//}
