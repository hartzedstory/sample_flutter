import 'package:flutter/material.dart';
import 'package:sample_flutter/listview_viewcontroller.dart';

void main() {
  runApp(TestClassWidget());
}

class TestClassWidget extends StatelessWidget {
  const TestClassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Demo Cupertino Style", home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('Title Header'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(children: [
                Text("Has pressed: $_pressedNumber"),
                ElevatedButton(onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Elevate Button")));
                }, child: Text("Click me")),
                ElevatedButton(onPressed: () {
                  _routeMe();
                }, child: Text("Route me"))
              ],),
              Image.asset('assets/avatar.jpg')
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

  void _routeMe() {
    ///Cach 1: pushVC
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return ListViewViewController();
          }));

    // ///Cach 2: showDialog
    //   showDialog(context: context,
    //       builder: (BuildContext context) {
    //         return Dialog(
    //           shape: RoundedRectangleBorder(),
    //           child: SizedBox(
    //             height: 400,
    //             child: ListViewViewController(),
    //           ),
    //         );
    //       });

      // ///Cach 3: showModalBottomSheet
      // showModalBottomSheet(context: context,
      //     builder: (BuildContext context) {
      //       return DraggableScrollableSheet(
      //         expand: false,
      //         builder: (context, scrollController) {
      //           return ListViewViewController();
      //         },
      //       );
      //     });
  }
}
