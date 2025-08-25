import 'package:flutter/material.dart';
import 'package:sample_flutter/main.dart';

void main() {
  runApp(TestClassWidget());
}

class TestClassWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Demo Cupertino Style", home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //MARK: INIT
  var _pressedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Title Test'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Test Center Content"),
              Text("Has pressed: ${_pressedNumber}"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one_rounded),
        onPressed: () {
          setState(() {
            _pressedNumber++;
          });
        },
      ),
    );
  }
}
