import 'package:flutter/material.dart';
import 'package:news/core/class/app_colors.dart';
import 'package:news/model/source_model_hive.dart';
import 'package:provider/provider.dart';

import '../../provider/myprovider.dart';

class ListNewsCategories extends StatelessWidget {
  final List<SourceModelHive> data;
  final void Function(int)? ontap;
  final int selected;
  const ListNewsCategories({
    super.key,
    required this.data,
    this.ontap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    var provider = Provider.of<MyProvider>(context);
    bool isDark = provider.themeMode == ThemeMode.dark;
    return DefaultTabController(
      length: data.length,
      initialIndex: selected,
      child: TabBar(
          onTap: ontap,
          dividerHeight: 0,
          isScrollable: true,
          indicatorColor: isDark ? AppColors.secondary : AppColors.primary,
          tabs: data
              .map((element) => Tab(
                    child: Text(
                      "${element.name}",
                      style: textStyle.bodyLarge!.copyWith(
                          color:
                              isDark ? AppColors.secondary : AppColors.primary),
                    ),
                  ))
              .toList()),
    );
  }
}
