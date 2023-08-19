import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_caffee_orders/services/service.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    var orders = [];
    on<OrderEvent>((event, emit) async {
      if (event is OrderLoad) {
        var data = await Services().initDb();

        orders = data[1];

        emit(OrderLoaded(orders));
      }
      if (event is OrderAdd) {
        orders.add(
            {'name': event.table, 'price': event.price, 'list': event.list});
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getString("localOrders") == null) {
          final jsonData = jsonEncode(orders);
          prefs.setString("localOrders", jsonData);
        } else {
          final List list1 =
              jsonDecode(prefs.getString("localOrders").toString());
          list1.add(
              {'name': event.table, 'price': event.price, 'list': event.list});
          final jsonData = jsonEncode(list1);
          prefs.setString("localOrders", jsonData);
        }

        emit(OrderLoaded(orders));
      }
    });
  }
}
