import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/class/app_colors.dart';

class ButtonViewAll extends StatelessWidget {
  final int i;
  const ButtonViewAll({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Align(
      alignment: i % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
          alignment: i % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          height: h * 0.07,
          width: w * 0.43,
          decoration: BoxDecoration(
            color: AppColors.icon,
            borderRadius: BorderRadius.circular(80),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              i % 2 != 0
                  ? SizedBox(
                      height: 0,
                      width: 0,
                    )
                  : Expanded(
                      child: Text(
                      "view_all".tr(),
                      textAlign: TextAlign.center,
                      style: textStyle.titleLarge,
                    )),
              SizedBox(
                height: double.infinity,
                width: 60,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: i % 2 != 0
                      ? Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.secondary,
                        )
                      : Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.secondary,
                        ),
                ),
              ),
              i % 2 != 0
                  ? Expanded(
                      child: Text(
                      textAlign: TextAlign.center,
                      "view_all".tr(),
                      style: textStyle.titleLarge,
                    ))
                  : SizedBox(
                      height: 0,
                      width: 0,
                    )
            ],
          )),
    );
  }
}
