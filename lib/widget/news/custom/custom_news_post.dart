import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/class/app_colors.dart';
import 'package:news/custom/custom_button.dart';
import 'package:news/model/everything_model.dart';
import 'package:news/provider/myprovider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomNewsPost extends StatelessWidget {
  final List<Articles> data;
  final int i;
  final void Function()? ontap;
  bool isButtomSheet;
  CustomNewsPost(
      {super.key,
      required this.data,
      required this.i,
      this.ontap,
      this.isButtomSheet = false});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    var provider = Provider.of<MyProvider>(context);
    bool isDark = provider.themeMode == ThemeMode.dark;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: h * 0.35,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: !isDark
                ? isButtomSheet
                    ? AppColors.primary
                    : AppColors.secondary
                : !isButtomSheet
                    ? AppColors.primary
                    : AppColors.secondary,
            border: Border.all(
                width: 1,
                color: !isDark ? AppColors.primary : AppColors.secondary),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "${data[i].urlToImage}",
                  height: h,
                  width: w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            isButtomSheet
                ? Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Text(
                        "${data[i].description}",
                        style: textStyle.titleMedium!.copyWith(
                            color: !isDark
                                ? AppColors.secondary
                                : AppColors.primary),
                      ),
                    ),
                  )
                : Expanded(
                    flex: 1,
                    child: Text(
                      "${data[i].title}",
                      style: textStyle.titleMedium!.copyWith(
                          color:
                              isDark ? AppColors.secondary : AppColors.primary),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            isButtomSheet
                ? CustomButton(
                    textColor:
                        !isDark ? AppColors.primary : AppColors.secondary,
                    color: isDark ? AppColors.primary : AppColors.secondary,
                    ontap: () async {
                      final Uri uri = Uri.parse("${data[i].url}");
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.platformDefault);
                      } else {
                        print("Could not launch $uri");
                      }
                    },
                    title: "view_full_articel".tr(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        //    height: 30,
                        child: Text(
                          "By : ${data[i].author}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppColors.icon),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${data[i].publishedAt}".substring(0, 10),
                            style: TextStyle(color: AppColors.icon),
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
