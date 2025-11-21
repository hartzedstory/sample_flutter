
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DemoViewController.dart';

class ListViewViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Man hinh list view"),),
      body: SafeArea(child:
      Column(
        children: [
          Container(
            height: 150,
            child: ListView(padding: EdgeInsets.all(8),
              children: [
                ///Khai bao cac thanh phan co trong list view
                Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: Center(child: Text("Entry A"),),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: Center(child: Text("Entry B"),),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: Center(child: Text("Entry C"),),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
          buildListView2(),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Pop me"),),
          ),
          ElevatedButton(onPressed: () {
            _routeMeToDemo(context);
          }, child: Text("Navigate me to demo screen"),)
        ],
      )
      )
    );
  }

  Widget buildListView2() {
    final List<String> entries = ["A", "B", "C"];
    final List<int> colorCode = [600, 500, 100];

    return Container(
      height: 250,
      child: ListView.separated(
          padding: EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCode[index]],
              child: Center(child: Text("Entry ${entries[index]}"),),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: entries.length),
    );
  }

  void _routeMeToDemo(BuildContext context) {
      ///Push viewcontroller
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return DemoViewController();
        }));
  }
}