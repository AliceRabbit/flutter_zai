import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';

class LoaddingWidget extends StatelessWidget {
  const LoaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: AppStyle.edgeInsetsA24,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
