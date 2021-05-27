import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_redux/chat_app/state/chat_state.dart';

import 'chat_item.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<ChatAppState>(
      builder: (context, store) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          var pos = store.state.pos ?? controller.position.maxScrollExtent;
          controller.jumpTo(pos);
        });
        return ListView(
          controller: controller,
          dragStartBehavior: DragStartBehavior.down,
          children: store.state.list.map((e) => ChatItem(e)).toList(),
        );
      },
    );
  }
}
