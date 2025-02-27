import 'package:flutter/material.dart';
import 'package:news/core/static/categories.dart';
import 'package:news/provider/myprovider.dart';
import 'package:provider/provider.dart';

class BackgroundImage extends StatelessWidget {
  final int i;
  const BackgroundImage({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    bool isLight = provider.themeMode == ThemeMode.light;
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
            !isLight ? categories[i]["image"] : categoriesDark[i]["image"],
            fit: BoxFit.cover));
  }
}
