import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/flutterando/controllers/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(children: [
          GestureDetector(
            child: Text('Contador: $counter'),
            onTap: () {
              setState(() {
                counter++;
              });
            },
            onDoubleTap: () => setState(() => counter--),
          ),
          Switch(
            value: AppController.instance.isDdarkTheme,
            onChanged: (value) {
              AppController.instance.toggleTheme();
            },
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
