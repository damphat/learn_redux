import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions {
  Increment,
  Decrement,
}

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  } else if (action == Actions.Decrement) {
    return state - 1;
  }
  return state;
}

void main() {
  runApp(
    StoreProvider(
      store: Store<int>(
        counterReducer,
        initialState: 10,
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: StoreConnector<int, String>(
                    converter: (store) => store.state.toString(),
                    builder: (context, count) {
                      return Text('$count');
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child:
                    StoreConnector<int, Function(Actions)>(converter: (store) {
                  return (Actions actions) => store.dispatch(actions);
                }, builder: (context, dispatch) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await dispatch(Actions.Increment);
                        },
                        child: Icon(Icons.add),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          await dispatch(Actions.Decrement);
                        },
                        child: Icon(Icons.remove),
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
