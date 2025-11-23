import 'package:flutter/material.dart';
import 'package:sample_flutter_module/ChatListView.dart';

class DemoChatCustomView extends StatefulWidget {
  const DemoChatCustomView({super.key});

  @override
  State<DemoChatCustomView> createState() => _DemoChatCustomViewState();
}

class _DemoChatCustomViewState extends State<DemoChatCustomView> {
  final List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {

        },
      ),
      body: const ChatListView()
    );
  }
}
