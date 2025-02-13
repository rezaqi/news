import 'package:flutter/material.dart';
import 'package:news/class/app_colors.dart';
import 'package:news/data/get_everything.dart';
import 'package:news/model/everything_model.dart';
import 'package:news/provider/myprovider.dart';
import 'package:news/widget/news/custom/custom_news_post.dart';
import 'package:provider/provider.dart';

class NewsCategories extends StatelessWidget {
  final String category;
  const NewsCategories({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    var provider = Provider.of<MyProvider>(context);
    bool isDark = provider.themeMode == ThemeMode.dark;
    return FutureBuilder<EverythingModel>(
      future: ApiEverything.getEverything(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("error ${snapshot.error}");
        } else {
          List<Articles> data = snapshot.data?.articles ?? [];

          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) => CustomNewsPost(
                ontap: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          height: h * 0.6,
                          width: w * 0.94,
                          decoration: BoxDecoration(
                              color: isDark ? AppColors.primary : Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: CustomNewsPost(
                              isButtomSheet: true, data: data, i: index));
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
