class Todo {
  Todo({required this.text, required this.done});

  String text;
  bool done;
}

class AddTodo {
  AddTodo(this.todo);
  Todo todo;
}

class RemoveTodo {
  RemoveTodo(this.todo);
  Todo todo;
}

class ToggleTodo {
  ToggleTodo(this.todo);
  Todo todo;
}

List<Todo> todosReducer(List<Todo> todos, dynamic action) {
  if (action is AddTodo) {
    return [...todos, action.todo];
  }

  if (action is RemoveTodo) {
    return todos.where((e) => e != action.todo).toList();
  }

  if (action is ToggleTodo) {
    return todos
        .map((e) =>
            e == action.todo ? Todo(text: e.text + '.', done: !e.done) : e)
        .toList();
  }
  return todos;
}
