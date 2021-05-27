import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_redux/chat_app/state/chat_state.dart';

class ChatInput extends StatefulWidget {
  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    var store = StoreProvider.of<ChatAppState>(context, listen: false);
    controller.text = store.state.input;
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<ChatAppState>(builder: (context, store) {
      if (controller.text != store.state.input) {
        controller.text = store.state.input;
      }
      return TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: (text) {
          // var store = StoreProvider.of<ChatAppState>(context, listen: false);
          store.dispatch(store.state.setInput(text));
        },
        onSubmitted: (text) {
          // var store = StoreProvider.of<ChatAppState>(context, listen: false);
          store.dispatch(store.state.submit());
          focusNode.requestFocus();
        },
      );
    });
  }
}
