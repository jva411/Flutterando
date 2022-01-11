import 'package:flutter/material.dart';

import 'package:my_first_flutter_app/flutterando/pages/home.dart';
import 'package:my_first_flutter_app/flutterando/controllers/app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(primarySwatch: AppController.instance.isDdarkTheme ? Colors.red : Colors.blue),
          home: HomePage()
        );
      }
    );
  }
}
