class ChangeInput {
  ChangeInput(this.input);
  String input;
}

String inputReducer(String input, dynamic action) {
  if (action is ChangeInput) {
    return action.input;
  }
  return input;
}
