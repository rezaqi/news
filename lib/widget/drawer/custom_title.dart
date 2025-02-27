import 'package:flutter/material.dart';
import 'package:news/core/class/app_colors.dart';
import 'package:news/provider/myprovider.dart';
import 'package:provider/provider.dart';

class CustomTitle extends StatefulWidget {
  final bool isChoose;
  final String title;
  final String subTitle;
  final IconData icon;
  final String subTitle1;
  final String subTitle2;
  final void Function()? ontap;
  final void Function()? ontapSub1;
  final void Function()? ontapSub2;

  const CustomTitle({
    super.key,
    required this.isChoose,
    required this.title,
    this.subTitle = "",
    required this.icon,
    this.ontap,
    required this.subTitle1,
    required this.subTitle2,
    this.ontapSub1,
    this.ontapSub2,
  });

  @override
  State<CustomTitle> createState() => _CustomTitleState();
}

class _CustomTitleState extends State<CustomTitle> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    TextTheme textStyle = Theme.of(context).textTheme;
    return Column(
      children: [
        InkWell(
          onTap: widget.ontap,
          child: Row(
            spacing: 10,
            children: [
              Icon(
                widget.icon,
                color: AppColors.secondary,
                size: 30,
              ),
              Text(
                widget.title,
                style: textStyle.titleLarge,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        widget.isChoose
            ? InkWell(
                onTap: () {
                  isTap = !isTap;
                  setState(() {});
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: isTap ? 100 : 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 2, color: AppColors.secondary),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isTap
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: widget.ontapSub1,
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      widget.subTitle1,
                                      style: textStyle.titleMedium,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Divider(
                                    color: AppColors.primary,
                                    height: 10,
                                  ),
                                ),
                                InkWell(
                                  onTap: widget.ontapSub2,
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      widget.subTitle2,
                                      style: textStyle.titleMedium,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Text(
                              widget.subTitle,
                              style: textStyle.bodyLarge,
                            ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: AppColors.secondary,
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
