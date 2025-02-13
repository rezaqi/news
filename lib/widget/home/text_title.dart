import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/class/app_colors.dart';
import 'package:news/provider/myprovider.dart';
import 'package:provider/provider.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    var provider = Provider.of<MyProvider>(context);

    return Text(
      "good_morning".tr(),
      style: textStyle.titleLarge!.copyWith(
          color: provider.themeMode == ThemeMode.dark
              ? AppColors.secondary
              : AppColors.primary),
    );
  }
}
