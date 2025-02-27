import 'package:flutter/material.dart';
import 'package:news/core/static/categories.dart';
import 'package:news/widget/home/background_image.dart';
import 'package:news/widget/home/button_view_all.dart';
import 'package:news/widget/home/text_title.dart';

class HomeScreen extends StatelessWidget {
  var ontap;
  HomeScreen({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(),
        SizedBox(height: 20),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        BackgroundImage(
                          i: index,
                        ),
                        InkWell(
                          onTap: () {
                            ontap(categories[index]['name']);
                          },
                          child: ButtonViewAll(
                            i: index,
                          ),
                        )
                      ],
                    )))
      ],
    );
  }
}
