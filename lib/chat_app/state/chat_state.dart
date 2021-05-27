class ChatAppState {
  ChatAppState({required this.list, required this.input, required this.pos});
  List<ChatItemState> list = [];
  String input = "";
  double? pos;

  ChatAppState add(ChatItemState item) {
    return ChatAppState(
      list: [...this.list, item],
      input: this.input,
      pos: this.pos,
    );
  }

  ChatAppState remove(ChatItemState item) {
    return ChatAppState(
      list: list.where((e) => e != item).toList(),
      input: input,
      pos: this.pos,
    );
  }

  ChatAppState setInput(String input) {
    return ChatAppState(
      list: list,
      input: input,
      pos: this.pos,
    );
  }

  ChatAppState submit() {
    return ChatAppState(
      list: [...this.list, ChatItemState(text: this.input)],
      input: "",
      pos: this.pos,
    );
  }

  ChatAppState setPos(double? pos) {
    return ChatAppState(list: list, input: input, pos: pos);
  }
}

class ChatItemState {
  ChatItemState({required this.text});
  String text;
}
