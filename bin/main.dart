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
    syncStream: true,
    distinct: true,
    initialState: 0,
    middleware: [
      (s, a, n) async {
        print('begin1');
        await Future.delayed(Duration(milliseconds: 500));
        await n(a);
        await Future.delayed(Duration(milliseconds: 500));
        print('end1');
      },
      (s, a, n) {
        print('begin2');
        n(a);
        print('end2');
      }
    ],
  );

  store.onChange.listen((event) {
    print(event);
  });

  store.onChange.listen((event) {
    print('$event again');
  });

  store.dispatch('INC');
}
