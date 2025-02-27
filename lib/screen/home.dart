import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/class/app_colors.dart';
import 'package:news/provider/myprovider.dart';
import 'package:news/widget/drawer/drawer_widget.dart';
import 'package:news/widget/home/home_screen.dart';
import 'package:news/widget/news/news_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      drawer: DrawerWidget(
        ontap: () {
          categorySelected = null;
          Navigator.of(context).pop();
          setState(() {});
        },
      ),
      appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: provider.themeMode == ThemeMode.light
                    ? AppColors.primary
                    : AppColors.secondary,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          forceMaterialTransparency: true,
          backgroundColor: provider.themeMode == ThemeMode.dark
              ? AppColors.primary
              : AppColors.secondary,
          title: Text('home'.tr(),
              style: textStyle.titleLarge!.copyWith(
                  color: provider.themeMode == ThemeMode.dark
                      ? AppColors.secondary
                      : AppColors.primary)),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: provider.themeMode == ThemeMode.light
                    ? AppColors.primary
                    : AppColors.secondary,
              ),
              onPressed: () {},
            ),
          ]),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: categorySelected == null
              ? HomeScreen(
                  ontap: ontapCategory,
                )
              : NewsScreen(
                  category: categorySelected!,
                )),
    );
  }

  String? categorySelected = null;
  ontapCategory(String category) {
    categorySelected = category;
    setState(() {});
  }
}
