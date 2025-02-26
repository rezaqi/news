import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/get_home_bloc.dart';
import 'package:news/bloc/states/news_states.dart';
import 'package:news/model/source_moddel.dart';
import 'package:news/repository/home_repo_impl.dart';
import 'package:news/widget/news/list_news_categories.dart';
import 'package:news/widget/news/news_categories.dart';

class NewsScreen extends StatelessWidget {
  final String category;
  const NewsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetHomeBloc>(
      create: (context) =>
          GetHomeBloc(HomeRepositoryImpl())..getSources(category),
      child: BlocBuilder<GetHomeBloc, HomeState>(
        builder: (context, state) {
          if (state is SourcesLoadingStates) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SourcesErrorStates) {
            return const Center(child: Text("Something Wrong"));
          }
          var bloc = context.read<GetHomeBloc>();
          List<Sources> data = bloc.sourceModel?.sources ?? [];

          return Column(
            children: [
              ListNewsCategories(
                selected: bloc.selectedIndex,
                ontap: (val) {
                  bloc.changeIndex(val);
                },
                data: data,
              ),
              NewsCategories(index: bloc.selectedIndex),
            ],
          );
        },
      ),
    );
  }
}
