import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_redux/chat_app/state/chat_state.dart';

import 'chat_item.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ChatState, List<ChatItemState>>(
      builder: (context, list) {
        return ListView(children: list.map((e) => ChatItem(e)).toList());
      },
      converter: (store) {
        return store.state.list;
      },
    );
  }
}
