class ChatState {
  ChatState({required this.list, required this.input});
  List<ChatItemState> list = [];
  String input = "";

  ChatState add(ChatItemState item) {
    return ChatState(
      list: [...this.list, item],
      input: this.input,
    );
  }

  ChatState remove(ChatItemState item) {
    return ChatState(
      list: list.where((e) => e != item).toList(),
      input: input,
    );
  }
}

class ChatItemState {
  ChatItemState({required this.text});
  String text;
}
