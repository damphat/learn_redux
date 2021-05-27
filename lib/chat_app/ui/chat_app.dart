import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:learn_redux/chat_app/state/chat_state.dart';

import 'chat_input.dart';
import 'chat_list.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<ChatAppState>(
      store: Store(
        (state, action) {
          if (action is ChatAppState) {
            return action;
          }

          return state;
        },
        initialState: ChatAppState(
          list: [
            ChatItemState(text: 'hello'),
          ],
          input: '',
          pos: 10,
        ),
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('self chat'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ChatList(),
              ),
              ChatInput(),
            ],
          ),
        ),
      ),
    );
  }
}
