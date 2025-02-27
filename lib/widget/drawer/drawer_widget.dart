import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/class/app_colors.dart';
import 'package:news/provider/myprovider.dart';
import 'package:news/widget/drawer/custom_title.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  final void Function()? ontap;
  const DrawerWidget({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    var provider = Provider.of<MyProvider>(context);

    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.primary,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColors.secondary),
              child: Text(
                "News App",
                style: textStyle.titleLarge!.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 20,
                children: [
                  CustomTitle(
                    subTitle1: '',
                    subTitle2: '',
                    ontap: ontap,
                    isChoose: false,
                    icon: Icons.home_filled,
                    title: "go_to_home".tr(),
                  ),
                  Divider(),
                  CustomTitle(
                    ontapSub1: () {
                      provider.cangeToLight();
                    },
                    ontapSub2: () {
                      provider.cangeToDark();
                    },
                    subTitle1: 'light'.tr(),
                    subTitle2: 'dark'.tr(),
                    isChoose: true,
                    icon: Icons.color_lens_outlined,
                    title: "theme".tr(),
                    subTitle: provider.themeMode == ThemeMode.dark
                        ? "dark".tr()
                        : "light".tr(),
                  ),
                  Divider(),
                  CustomTitle(
                    ontapSub1: () {
                      provider.changeLocale(context, "en");
                    },
                    ontapSub2: () {
                      provider.changeLocale(context, "ar");
                    },
                    subTitle1: 'english'.tr(),
                    subTitle2: 'arabic'.tr(),
                    isChoose: true,
                    icon: Icons.language_outlined,
                    title: "language".tr(),
                    subTitle: context.locale == Locale('en')
                        ? "english".tr()
                        : 'arabic'.tr(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
