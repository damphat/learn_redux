import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:learn_redux/chat_app/state/chat_state.dart';

import 'chat_input.dart';
import 'chat_list.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<ChatState>(
      store: Store(
        (state, action) {
          if (action is ChatState) {
            return action;
          }

          return state;
        },
        initialState: ChatState(
          list: [
            ChatItemState(text: 'hello'),
          ],
          input: '',
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
