import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/get_home_bloc.dart';
import 'package:news/bloc/states/news_states.dart';
import 'package:news/class/app_colors.dart';
import 'package:news/model/everything_model.dart';
import 'package:news/provider/myprovider.dart';
import 'package:news/widget/news/custom/custom_news_post.dart';
import 'package:provider/provider.dart';

class NewsCategories extends StatelessWidget {
  final int index;
  const NewsCategories({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    var provider = Provider.of<MyProvider>(context);
    bool isDark = provider.themeMode == ThemeMode.dark;

    return BlocConsumer<GetHomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsLoadingStates) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsErrorStates) {
          return const Center(child: Text("Error"));
        } else {
          var bloc = BlocProvider.of<GetHomeBloc>(context);
          List<Articles>? data = bloc.model?.articles ?? [];

          if (data.isEmpty) {
            return const Center(child: Text("Empty"));
          }

          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: data.length,
              itemBuilder: (context, index) => CustomNewsPost(
                ontap: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: h * 0.6,
                        width: w * 0.94,
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: CustomNewsPost(
                          isButtomSheet: true,
                          data: data,
                          i: index,
                        ),
                      );
                    },
                  );
                },
                i: index,
                data: data,
              ),
            ),
          );
        }
      },
    );
  }
}
