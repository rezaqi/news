import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:news/bloc/states/news_states.dart';
import 'package:news/model/everything_model.dart';
import 'package:news/model/source_moddel.dart';
import 'package:news/repository/home_repo.dart';

class GetHomeBloc extends Cubit<HomeState> {
  final HomeRepository homeRepo;
  EverythingModel? model;
  SourceModel? sourceModel;
  int selectedIndex = 0;

  GetHomeBloc(this.homeRepo) : super(NewsInitStates());

  Future<void> getSources(String category) async {
    var logger = Logger();
    try {
      emit(SourcesLoadingStates());
      sourceModel = await homeRepo.getSources(category);
      logger.f(sourceModel);

      if (sourceModel!.status == "ok") {
        await getNews();
        emit(SourcesSuccessStates());
      } else {
        emit(SourcesErrorStates());
      }
    } catch (e) {
      logger.e("Error: $e");
      emit(SourcesErrorStates());
    }
  }

  Future<void> getNews() async {
    var logger = Logger();

    try {
      emit(NewsLoadingStates());

      model = await homeRepo
          .getNews(sourceModel!.sources![selectedIndex].id ?? '0');

      if (model!.status == 'ok') {
        emit(NewsSuccessStates());
      } else {
        emit(NewsErrorStates());
      }
    } catch (e) {
      logger.e("Error: $e");
      emit(NewsErrorStates());
    }
  }

  Future<void> changeIndex(int value) async {
    if (selectedIndex != value) {
      selectedIndex = value;

      emit(ChangeIndexStates());
      await getNews();
    }
  }
}
