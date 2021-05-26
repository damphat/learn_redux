import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'todos.dart';
import 'input.dart';

class AppState {
  AppState({required this.todos, required this.input});

  final List<Todo> todos;
  final String input;
}

AppState reducer(AppState state, dynamic action) {
  return AppState(
    todos: todosReducer(state.todos, action),
    input: inputReducer(state.input, action),
  );
}

void main() {
  var store = Store<AppState>(
    reducer,
    initialState: AppState(
      input: '',
      todos: [
        Todo(text: 'ăn sáng', done: true),
        Todo(text: 'ăn trưa', done: false),
        Todo(text: 'ăn tối', done: false),
      ],
    ),
  );

  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('todos')),
          body: Column(
            children: [
              Expanded(
                child: StoreBuilder<AppState>(builder: (context, store) {
                  return ListView(
                    children: store.state.todos
                        .map(
                          (e) => Row(
                            children: [
                              Checkbox(
                                value: e.done,
                                onChanged: (b) {
                                  store.dispatch(ToggleTodo(e));
                                },
                              ),
                              Text(e.text),
                            ],
                          ),
                        )
                        .toList(),
                  );
                }),
              ),
              TodoInput()
            ],
          ),
        ),
      ),
    ),
  );
}

class TodoInput extends StatefulWidget {
  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  var controller = TextEditingController(text: '?');
  var focus = FocusNode();

  @override
  void initState() {
    super.initState();

    var store = StoreProvider.of<AppState>(context, listen: false);
    controller.text = store.state.input;
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(builder: (context, store) {
      if (controller.text != store.state.input)
        controller.text = store.state.input;
      print('build textfield');
      return TextField(
        controller: controller,
        focusNode: focus,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          hintText: 'type your todo ...',
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
        onChanged: (text) {
          store.dispatch(ChangeInput(text));
        },
        onSubmitted: (text) {
          store.dispatch(
            AddTodo(
              Todo(text: text, done: false),
            ),
          );

          store.dispatch(ChangeInput(''));
          focus.requestFocus();
        },
      );
    });
  }
}
