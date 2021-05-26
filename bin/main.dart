import 'package:redux/redux.dart';

int reducer(int state, dynamic action) {
  print('reducer');
  if (action == 'INC') {
    return state + 1;
  } else if (action == 'DEC') {
    return state - 1;
  }
  return state;
}

void main() async {
  var store = Store<int>(
    reducer,
    initialState: 0,
    middleware: [
      (s, a, n) async {
        print('begin1');
        await n(a);
        print('end2');
      },
      (s, a, n) async {
        print('begin2');
        await Future.delayed(Duration(seconds: 3));
        await n(a);
        await n(a);
        print('end2');
      }
    ],
  );

  store.dispatch('INC');
  await store.dispatch('INC');

  print(store.state);
}
