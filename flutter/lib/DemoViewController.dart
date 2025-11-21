import 'package:flutter/material.dart';

extension ContextSizeExt on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get safeHeight =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;
}

final class DemoViewController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DemoViewControllerState();
  }
}

class DemoViewControllerState extends State<DemoViewController> {
  ///Hàm build ra view. Tại đây khai báo các state cần sử dụng :)

  Image currentImage = Image.asset('assets/hulk.jpg');
  List<Image> imageList = [
    Image.asset('assets/hulk.jpg'),
    Image.asset('assets/avatar.jpg'),
    Image.asset('assets/baoboi.JPG'),
    Image.asset('assets/conmeobolao.jpg'),
    Image.asset('assets/hoicham.JPG'),
    Image.asset('assets/jerrython.JPG'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return _uiBuilder();
  }

  Scaffold _uiBuilder() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Change background Sacombank Lao'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .start,
            children: [
              Expanded(flex: 3, child: _previewView(context)),
              Expanded(flex: 7, child: _selectImage(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _previewView(BuildContext context) {
    return Container(
      color: Colors.red,
      height: context.safeHeight * 0.3,
      child: currentImage,
    );
  }

  Widget _selectImage(BuildContext context) {
    return GridView.builder(
      padding: .all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentImage = imageList[index];
            });
          },

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageList[index], // Image widget từ danh sách
            ),
          ),
        );
      },
    );
  }
}
