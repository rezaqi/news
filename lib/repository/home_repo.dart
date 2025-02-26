import 'package:news/model/everything_model.dart';
import 'package:news/model/source_moddel.dart';

abstract class HomeRepository {
  Future<SourceModel> getSources(String category);
  Future<EverythingModel> getNews(String sourceId);
}
