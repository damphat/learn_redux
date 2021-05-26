# flutter_redux

## StoreProvider<S>
- là một InheritedWidget
- cung cấp một Redux [Store] cho mọi descendants của nó.
- nên là root widget?
- nhiều loại store?

```
    // trong hàm build
    // lưu lý hàm 'of' sẽ lấy ra store đồng thời listen store provider
    final store = StoreProvider.of<int>(context);

    // trong hàm initState
    // cần disable cơ chế listen
    final store = StoreProvider.of<String>(context, listen: false)

    ...
```

- nếu muốn dùng trong initState() thì gán listen = false


