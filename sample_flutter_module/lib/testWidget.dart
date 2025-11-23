
class TestWidget {
  int width;
  int height;

  TestWidget({required this.width, required this.height});
}

void main() {
  TestWidget wg1 = TestWidget(width: 20, height: 20);
  print(wg1.toString());
}