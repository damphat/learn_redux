## store<T>
- store bao gồm 1 reducer và 1 state
- có thể combine nhiều reducers thành một
    - dạng cha-con:  reducer gọi các reducers tương ứng cho từng nhánh con  (car, a) => State(reducerEngine(state.engine, a),  reducerWheels(state.wheels, a))
    - dạng anh-em: reducer gọi các reducers liên tiếp cho một state duy nhất  (car, a) = reducerPainting(reducerCleanning(car, a), a);

- reducer luôn là sync
- nhưng dispatch là sync hoặc async, tuỳ vào middlewares


## middlewares
- stores có 0 hoặc nhiều middleware, gọi là M0, M1, M2 ...
- hàm dispatch, sẽ chỉ call M0 (nếu có), và return giá trị trả về của M0
- M[n] sẽ gọi M[n+1] thông qua hàm `next` (lưu ý `next` là tham số của hàm middleware)
- Middleware cuối cùng sẽ gọi reducer thông qua hàm next
- hàm dispatch sẽ return giá trị mà M0 trả về

## distint

- một action có thể không tạo ra sự thay đổi state. Gán distint = true để loại bỏ các event không tạo ra sự thay đổi.
- sự thay đổi dựa vào operator `==` của state (lưu ý đó là toán tử có thể override)
- mặc định distint = false

## syncStream
gán syncStream = true, event được sinh ra ngay trong cycle. Mặc định syncStream = false, event sẽ được tạo ra ở cycle sau

## listen
- store.onChange là broadcast stream