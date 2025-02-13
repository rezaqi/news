import 'package:flutter/material.dart';
import 'package:news/data/api_manager.dart';
import 'package:news/model/source_moddel.dart';
import 'package:news/widget/news/list_news_categories.dart';
import 'package:news/widget/news/news_categories.dart';

class NewsScreen extends StatefulWidget {
  final String category;
  const NewsScreen({super.key, required this.category});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceModel>(
        future: ApiManager.getSources(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          } else {
            List<Sources> data = snapshot.data?.sources ?? [];
            return Column(
              spacing: 10,
              children: [
                ListNewsCategories(
                  selected: selectedIndex,
                  ontap: (value) {
                    selectedIndex = value;
                    setState(() {});
                  },
                  data: data,
                ),
                NewsCategories(
                  category: "${data[selectedIndex].id}",
                )
              ],
            );
          }
        });
  }
}

///
