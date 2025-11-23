import 'package:flutter/material.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => ChatListViewState();
}

class ChatListViewState extends State<ChatListView> {
  final List<Map<String, dynamic>> items = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    appendData();
  }

  /// Thêm 10 item mới
  void appendData() {
    final start = items.length;

    for (int i = 0; i < 100000; i++) {
      final index = start + i;
      items.add({
        'name': 'User $index',
        'message': 'Message $index',
        'time': DateTime.now().subtract(Duration(minutes: index)).toString(),
        'avatar': 'https://picsum.photos/50/50?random=$index',
        'photo': 'https://picsum.photos/400/500?random=$index',
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Demo Chat View'),
          floating: true,
          snap: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = items[index];

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- View nhỏ ---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item['avatar'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(item['message']),
                            Text(
                              item['time'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // --- Ảnh lớn ---
                  Image.network(
                    item['photo'],
                    width: 400,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          }, childCount: items.length),
        ),
      ],
    );
  }
}
