import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final void Function()? ontap;
  const CustomButton(
      {super.key,
      required this.title,
      this.ontap,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: textTheme.titleMedium!.copyWith(color: textColor),
        ),
      ),
    );
  }
}
