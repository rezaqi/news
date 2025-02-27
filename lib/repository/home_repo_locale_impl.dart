import 'package:news/hive/cache_helper.dart';
import 'package:news/model/news_model.dart';
import 'package:news/model/source_moddel.dart';
import 'package:news/model/source_model_hive.dart';
import 'package:news/repository/home_repo.dart';

class HomeRepoLocaleImpl implements HomeRepository {
  @override
  Future<EverythingModel> getNews(String sourceId) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

  @override
  Future<SourceModel> getSources(String category) async {
    List<SourceModelHive> sources =
        await HiveCacheHelper<List<SourceModelHive>>()
                .getBox(HiveCacheHelper.boxSources) ??
            [];
    return SourceModel(status: "ok", sources: sources);
  }
}
