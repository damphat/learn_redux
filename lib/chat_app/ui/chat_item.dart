import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_redux/chat_app/state/chat_state.dart';

class ChatItem extends StatelessWidget {
  ChatItem(this.state);
  final ChatItemState state;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<ChatAppState>(
      builder: (context, store) => ListTile(
        title: Text(state.text),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            store.dispatch(store.state.remove(state));
          },
        ),
      ),
    );
  }
}
