import 'package:flutter/material.dart';
import 'package:zaix/app/app_constant.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= AppConstant.kTabletWidth
        ? Container()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Image.asset("assets/images/logo_dmzj.png", height: 80),
            ),
          );
  }
}
