import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';
import 'package:get/get.dart';

class ShadowCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final Function()? onTap;
  final Function()? onLongPress;
  const ShadowCard({
    required this.child,
    this.radius = 8.0,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: Get.isDarkMode
            ? []
            : [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey.withValues(alpha: .2),
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: onTap,
            onLongPress: onLongPress,
            child: Container(
              decoration: BoxDecoration(borderRadius: AppStyle.radius8),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
